import excel "D:\Kerjaan\Project 4951\Dataset Hasil Survey.xlsx", sheet("Dataset Survey") firstrow

gen gender_num = .
replace gender_num = 1 if JenisKelamin == "Pria"
replace gender_num = 2 if JenisKelamin== "Wanita"

gen age = .
replace age = 1 if Usia == "17 - 25 Tahun"
replace age = 2 if Usia == "26 - 30 Tahun"
replace age = 3 if Usia == "31 - 40 Tahun"
replace age = 4 if Usia == "Di atas 40 Tahun"

gen education = .
replace education = 1 if Pendidikan == "SMP/Sederajat atau lebih rendah"
replace education = 2 if Pendidikan == "SMA/Sederajat"
replace education = 3 if Pendidikan == "Diploma/Sarjana"
replace education = 4 if Pendidikan == "Pascasarjana"

gen salary = .
replace salary = 1 if Pendapatanratarataperbulan == "Kurang dari Rp 1.500.000,00"
replace salary = 2 if Pendapatanratarataperbulan == "Rp 1.500.000,00 s.d. Rp 2.500.000,00"
replace salary = 3 if Pendapatanratarataperbulan == "Rp 2.500.000,00 s.d. Rp 3.500.000,00"
replace salary = 4 if Pendapatanratarataperbulan == "Lebih dari Rp 3.500.000,00"


gen experience = .
replace experience = 1 if PengalamanFrekuensipenggunaan == "1 s.d. 2"
replace experience = 2 if PengalamanFrekuensipenggunaan == "2 s.d. 4"
replace experience = 3 if PengalamanFrekuensipenggunaan == "5 s.d. 9"
replace experience = 4 if PengalamanFrekuensipenggunaan == "10 atau lebih banyak"

label define experiences 1 "1 s.d. 2" 2 "2 s.d. 4" 3 "5 s.d. 9" 4 "10 atau lebih banyak"
label define salary 1 "Rp 1.500.000,00 s.d. Rp 2.500.000,00" 2 "Rp 2.500.000,00 s.d. Rp 3.500.000,00" 3 "Lebih dari Rp 3.500.000,00"
label define gender 1 "Pria" 2 "Wanita"
label define age 1 "17 - 25 Tahun" 2 "26 - 30 Tahun" 3 "31 - 40 Tahun" 4 "Di atas 40 Tahun"
label define education 1 "SMP/Sederajat atau lebih rendah" 2 "SMA/Sederajat" 3 "Diploma/Sarjana" 4 "Pascasarjana"
label values experience experiences
label values salary salary
label values education education
label values age age
label values gender_num gender

summarize eu1-experience

tabulate gender_num
tabulate age
tabulate education
tabulate salary
tabulate experience

tabulate eu1 
tabulate eu2
tabulate eu3
tabulate eu4 
tabulate uo1
tabulate uo2
tabulate uo3
tabulate uo4
tabulate pj1
tabulate pj2
tabulate pj3
tabulate pj4
tabulate tr1
tabulate tr2
tabulate tr3
tabulate tr4
tabulate fe1
tabulate fe2
tabulate fe3
tabulate fe4
tabulate pv1
tabulate pv2
tabulate pv3
tabulate pv4

* Harman's one factor test
factor eu1-pv4, pcf

* CFA
sem (EU -> eu1-eu4)(EU -> UO PJ TR FE)(UO -> uo1-uo4)(PJ -> pj1-pj4)(TR ->tr1-tr4)(FE-> fe1-fe4)(PV -> pv1-pv4)(UO PJ TR FE -> PV), group(experience)

*ssc install condisc
condisc

estat gof, stats(all)
estat ggof
 
 
