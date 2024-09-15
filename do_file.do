            *** National Health and Nutrition Examination Survey ***

							*** NHANES 2017-2018 ***
		   
		   
					*** Cleaning and Labelling the dataset *** 

*** Gender

recode Gender 1=0 2=1

label define gender1 0 "Male" 1 "Female"

label values Gender gender1

*** Race

label define race 1 "Meican American" 2 "Other Hispanic" 3 "Non-Hispanic White" 4 "Non-Hispanic Black" 5 "Other Race - Including Multi-Racial"

label values RaceHispanicorigin race

*** Marital status

label define ms 1 "Married" 2 "Widowed" 3 "Divorced" 4 "Separated" 5 "Never married" 6 "Living with partner"

label values Maritalstatus ms 

replace Maritalstatus = . if Maritalstatus == 77

*** Comorbidities

label define com 1 "Yes" 2 "No"

label values Everbeentoldyouhaveasthma Doctoreversaidyouhadarthrit Doctorevertoldyouthatyouha Evertoldhadcongestiveheartf Evertoldyouhadcoronaryheart Evertoldyouhadanginaangina Evertoldyouhadheartattack Evertoldyouhadastroke Evertoldyouhadthyroidproble Evertoldyouhademphysema Evertoldyouhadchronicbronch EvertoldyouhadCOPD Evertoldyouhadanylivercond HasDReversaidyouhavegallst Evertoldyouhadcancerormali com 

replace Everbeentoldyouhaveasthma = . if Everbeentoldyouhaveasthma == 9

replace Doctoreversaidyouhadarthrit = . if Doctoreversaidyouhadarthrit == 9 

replace Doctorevertoldyouthatyouha = . if Doctorevertoldyouthatyouha == 9 

replace Evertoldhadcongestiveheartf = . if Evertoldhadcongestiveheartf == 9 

replace Evertoldyouhadcoronaryheart = . if Evertoldyouhadcoronaryheart == 9 

replace Evertoldyouhadanginaangina = . if Evertoldyouhadanginaangina == 9 

replace Evertoldyouhadheartattack = . if Evertoldyouhadheartattack == 9 

replace Evertoldyouhadastroke = . if Evertoldyouhadastroke == 9 

replace Evertoldyouhadthyroidproble = . if Evertoldyouhadthyroidproble == 9 

replace Evertoldyouhadthyroidproble = . if Evertoldyouhadthyroidproble == 7

replace Evertoldyouhademphysema = . if Evertoldyouhademphysema == 9 

replace Evertoldyouhadchronicbronch = . if Evertoldyouhadchronicbronch == 9 

replace EvertoldyouhadCOPD = . if EvertoldyouhadCOPD == 9 

replace Evertoldyouhadanylivercond = . if Evertoldyouhadanylivercond == 9 

replace HasDReversaidyouhavegallst = . if HasDReversaidyouhavegallst == 9 

replace Evertoldyouhadcancerormali = . if Evertoldyouhadcancerormali == 9 

*** Diabetes 

label define dm 1 "Yes" 2 "No" 3 "Borderline"

label values Doctortoldyouhavediabetes dm

replace Doctortoldyouhavediabetes = . if Doctortoldyouhavediabetes == 9 

*** At least one comorbidity

label define comor 0 "No" 1 "Yes"

label values Atleastonecomorbidity comor 

*** PHQ-9

replace Havelittleinterestindoingth = . if Havelittleinterestindoingth ==7
replace Havelittleinterestindoingth = . if Havelittleinterestindoingth ==9

replace Feelingdowndepressedorhope = . if Feelingdowndepressedorhope ==7
replace Feelingdowndepressedorhope = . if Feelingdowndepressedorhope ==9

replace Troublesleepingorsleepingtoo = . if Troublesleepingorsleepingtoo ==7
replace Troublesleepingorsleepingtoo = . if Troublesleepingorsleepingtoo ==9

replace Feelingtiredorhavinglittlee = . if Feelingtiredorhavinglittlee ==7
replace Feelingtiredorhavinglittlee = . if Feelingtiredorhavinglittlee ==9

replace Poorappetiteorovereating = . if Poorappetiteorovereating ==7
replace Poorappetiteorovereating = . if Poorappetiteorovereating ==9

replace Feelingbadaboutyourself = . if Feelingbadaboutyourself ==7
replace Feelingbadaboutyourself = . if Feelingbadaboutyourself ==9

replace Troubleconcentratingonthings = . if Troubleconcentratingonthings ==7
replace Troubleconcentratingonthings = . if Troubleconcentratingonthings ==9

replace Thoughtyouwouldbebetteroff = . if Thoughtyouwouldbebetteroff ==7
replace Thoughtyouwouldbebetteroff = . if Thoughtyouwouldbebetteroff ==9

replace Movingorspeakingslowlyortoo = . if Movingorspeakingslowlyortoo ==7
replace Movingorspeakingslowlyortoo = . if Movingorspeakingslowlyortoo ==9
 
replace PHQ9 = Havelittleinterestindoingth + Feelingdowndepressedorhope + Troublesleepingorsleepingtoo + Feelingtiredorhavinglittlee + Poorappetiteorovereating + Feelingbadaboutyourself + Troubleconcentratingonthings + Movingorspeakingslowlyortoo + Thoughtyouwouldbebetteroff      

label define phq9 0 "Not at all" 1 "Several days" 2 "More than half the days" 3 "Nearly every day"
label values Havelittleinterestindoingth Feelingdowndepressedorhope Troublesleepingorsleepingtoo Feelingtiredorhavinglittlee Poorappetiteorovereating Feelingbadaboutyourself Troubleconcentratingonthings Movingorspeakingslowlyortoo Thoughtyouwouldbebetteroff phq9 

generate PHQ9_CAT = 0
replace PHQ9_CAT = 1 if PHQ9 <= 4
replace PHQ9_CAT = 2 if PHQ9 >= 5 & PHQ9 <= 9
replace PHQ9_CAT = 3 if PHQ9 >= 10 & PHQ9 <= 14
replace PHQ9_CAT = 4 if PHQ9 >= 15 & PHQ9 <= 19
replace PHQ9_CAT = 5 if PHQ9 >= 20

label define phq9cat 1 "Minimal depression" 2 "Mild depression" 3 "Moderate depression" 4 "Moderately severe depression" 5 "Severe depression"
label values PHQ9_CAT phq9cat

generate moderatesevere_depression = 0
replace moderatesevere_depression = 1 if PHQ9 >= 10

label define modsev_dep 0 "Non Moderate-Severe Depression" 1 "Moderate-Severe Depression"
label values moderatesevere_depression modsev_dep

*** Exercise

label define vig 1 "Yes" 2 "No"

label values Vigorousrecreationalactivities vig 

replace Daysvigorousrecreationalactiv = . if Daysvigorousrecreationalactiv ==99
replace Minutesvigorousrecreationalac = . if Minutesvigorousrecreationalac == 9999

label values Moderaterecreationalactivities vig
replace Daysmoderaterecreationalactiv = . if Daysmoderaterecreationalactiv ==99

replace Minutesmoderaterecreationalac = . if Minutesmoderaterecreationalac == 9999
replace Minutessedentaryactivity = . if Minutessedentaryactivity == 9999
  

*** Smoke

label define smoke 1 "Yes" 2 "No"

label values Smokedatleast100cigarettesi smoke 

label define smoke2 1 "Every day" 2 "Some days" 3 "Not at all" 

label values Doyounowsmokecigarettes smoke2 

*** Alcohol

label define alco 0 "Never in the last year" 1 "Every day" 2 "Nearly every day" 3 "3 to 4 times a week" 4 "2 times a week" 5 "Once a week" 6 "2 to 3 times a month" 7 "Once a month" 8 "7 to 11 times in the last year" 9 "3 to 6 times in the last year" 10 "1 to 2 times in the last year"

label values Past12mohowoftenhavealcoho alco 

. replace Past12mohowoftenhavealcoho = . if Past12mohowoftenhavealcoho == 77
. replace Past12mohowoftenhavealcoho = . if Past12mohowoftenhavealcoho == 99

. replace Avgalcoholdrinksdaypast = . if Avgalcoholdrinksdaypast == 777
. replace Avgalcoholdrinksdaypast = . if Avgalcoholdrinksdaypast == 999

. replace dayshave4or5drinkspast1 = . if dayshave4or5drinkspast1 == 77
. replace dayshave4or5drinkspast1 = . if dayshave4or5drinkspast1 == 99

  
*** Sleep

label define sleep 1 "Yes" 2 "No"
replace Evertolddoctorhadtroublesle = . if Evertolddoctorhadtroublesle == 9
label values Evertolddoctorhadtroublesle sleep 

label define sleep2 0 "Never" 1 "Rarely - 1 time a month" 2 "Sometimes - 2-4 times a month" 3 "Often - 5-15 times a month" 4 "Almost always - 16-30 times a month"
 replace Howoftenfeeloverlysleepydur = . if Howoftenfeeloverlysleepydur ==9
 label values Howoftenfeeloverlysleepydur sleep2 

 
*** Citizenship

label define country 1 "Born in 50 US States or Washington, DC" 2 "Others"
label values Countryofbirth country
. replace Countryofbirth = . if Countryofbirth ==77
. replace Countryofbirth = . if Countryofbirth == 99


label define city 1 "Citizen by birth or naturalization" 2 "Not a citizen of the US"
label values Citizenshipstatus city
. replace Citizenshipstatus = . if Citizenshipstatus == 7
. replace Citizenshipstatus = . if Citizenshipstatus ==9


label define lenght 1 "Less than 1 year" 2 "1 year or more, but less than 5 years" 3 "5 years or more, but less than 10 years" 4 "10 years or more, but less than 15 years" 5 "15 years or more, but less than 20 years" 6 "20 years or more, but less than 30 years" 7 "30 years or more, but less than 40 years" 8 "40 years or more, but less than 50 years" 9 "50 years or more"
label values LengthoftimeinUS lenght 
. replace LengthoftimeinUS = . if LengthoftimeinUS == 77
. replace LengthoftimeinUS = . if LengthoftimeinUS == 99

*** NSAIDs

label define nsaids 0 "No" 1 "Yes"
label values NSAID nsaids

 //////////////////////////////// Continue from here

*** BMI

histogram BodyMassIndexkgm2, normal
qnorm BodyMassIndexkgm2
swilk BodyMassIndexkgm2
histogram BodyMassIndexkgm2, kdensity kdenopts(gaussian)

*** T-test

ttest BodyMassIndexkgm2, by(Atleastonecomorbidity)

*** Pearson Correlation test

pwcorr BodyMassIndexkgm2 Carbohydrategm, sig obs

*** Spearman Correlation test

spearman BodyMassIndexkgm2 Carbohydrategm, stats(rho obs p)

*** Association 

scatter BodyMassIndexkgm2 Carbohydrategm

lowess BodyMassIndexkgm2 Carbohydrategm

*** lowess helps find smooth fit through a scatterplot of data to begin to assess  linearity or potential nonlinearity ***

reg BodyMassIndexkgm2 Carbohydrategm
predict yhat

scatter BodyMassIndexkgm2 yhat Carbohydrategm, ms(o i) connect(. l) 

*** Equation >>> BMI = 27.23 - 0.01*Carbs 

*** Coefficient of Determination (R2) = SS Residuals/SS Total

*** Residuals

reg BodyMassIndexkgm2 Carbohydrategm
predict resids, residuals  

lowess resids Carbohydrategm

histogram resids, normal

qnorm resids

*** Robust

reg BodyMassIndexkgm2 Carbohydrategm, vce(robust)

*** Confounders

lowess resids Zincmg

reg BodyMassIndexkgm2 Carbohydrategm Zincmg

reg BodyMassIndexkgm2 Carbohydrategm

*** (crude - adjusted)/(crude) 

pwcorr  BodyMassIndexkgm2 Carbohydrategm Zincmg, sig obs

*** Effect modification

generate interact = Gender*Carbohydrategm

reg BodyMassIndexkgm2 Carbohydrategm Gender interact

predict yhatint

*** For man: BMI = 26.72 -0.009*Carbs 
*** For woman: BMI = 27.74 -0.022*Carbs + 1.02

generate bmi_male = BodyMassIndexkgm2 if Gender ==0
generate bmi_female = BodyMassIndexkgm2 if Gender ==1

gen yhat_male_int = yhatint if Gender == 0
gen yhat_female_int = yhatint if Gender == 1


scatter bmi_male bmi_female yhat_male_int yhat_female_int Carbohydrategm, symbol(O T i i i) c(. . l l)

*** Logistic Regression

cs Atleastonecomorbidity Gender, or

logistic Atleastonecomorbidity Gender

** Hello everybody. Kindly find below the commands for the Friday optional lecture on 13th september 2024

**Step 1- please load your data set- Either NHANES 2017-2018 or 2005-2006
** For the purpose of this exercise I am loading 2005-2006


**Lets explore the dataset- all variables together. Each of these variables can be used for individual variables as well. If you dont specify then it will show you all. 

describe
summarize
codebook, compact
misstable summarize


** Think about the outcome variable you want to analyse
** For this exercise I am going to use the variable "Have you ever been told you have memory issues"

tabulate Experienceconfusionmemoryprob, missing

**You need to recode your variable- such that there are only 2 coded categories. Here the outcome is Yes/No- so we need to recode this variable so that 1= Yes and 0= No (remember to code all your variables as 0,1 for the logistic to work well)

recode Experienceconfusionmemoryprob 1=1 2=0 9=., generate(memory)
label define options 1"Yes" 0"No"
label values memory options
label variable memory "Experience confusion/memory problems"

tabulate memory, missing

**5.1% of the dataset were diagnosed with having memory issues, 37.7% had missing data
** Since we are doing a complete case analysis, its better to drop the observation who have a missing value for the main outcome (stata will automatically do it when you analyse, but doing this will clarity to your tables)

drop if memory==.
tabulate memory, missing
** after dropping the missing- 8.2% had a diagnosis of memory issues

** Now we think about the exposure variable and we need to clean its
** I am using an exposure- "How do you compare your physical activities with others of your same age"
** The hypothesis I want to look at is- Those who are less active that others of their same age have higher risk or odds of memory issues. So my main exposure is less activity (which I will code as 1) and my baseline group will equal or more activity (which I will code as 0).

tabulate Compareactivitywotherssamea, missing
recode Compareactivitywotherssamea 1=0 2=1 3=0 7=. 9=., generat(pa)
tabulat pa, missing

** Labelling the categories

label define pa 1" Less active" 0"More active"
label values pa pa
label variable pa "Compare activity w/others same age"

**Final tabulation and dropping observations with missing- as this is the main exposure

tabulate pa, missing
drop if pa==. 

** Lets start looking at our association between exposure and outcome by generating contingency tables
tabulate memory pa
tabulate memory pa, row col
tabulate memory pa, expected chi
tabulate memory pa, expected chi exact


** Now imagine that I also have a population characteristic that I want to consider- for example the hypothesis in older adults only.

summarize AgeatScreeningAdjudicatedR, d
rename AgeatScreeningAdjudicatedR age
tabulate memory pa if age>=50, expected chi exact

display 50/285
display 122/1219
display 0.1754386/0.10008203

**Now lets go on to do simple logistic regression models (logit and logistic).
logit memory pa if age>=50
logistic memory i.pa if age>=50

** If it becomes tiresome to keep on specifying the age parameter, you can choose to just drop all less than 50. But if you wish to retain the data in the dataset, then you can just use if to specify the filter, and remember to use it for all your commands
** I am going to drop all those less than 50, for simplicity sake

drop if age<50
logistic memory i.pa  // **This will now give you the same results as before

**If you compare and see, the logistic regression table gives you the same values that you calculated manually previously

**How do we get the LR chi value-

logistic memory
logistic memory i.pa
display 2*(-549.89946 +554.44317 )

**Extracting more information from the regression model
logistic memory i.pa
predict prob_pa  // **To be done immediately after the logistic regression


list pa prob_pa in 1/15
tabulate memory pa, row col
scatter prob_pa pa || line prob_pa pa


** Now I am thinking that age as a continuous variable is also important- as one gets older, the activity decreases, and also memory issue increase. So lets try adding that to the model.

logistic memory i.pa
logistic memory i.pa c.age

** Lets check if adding age to the model made the model better or not

logistic memory i.pa
estimates store A
logistic memory i.pa c.age
estimates store B
lrtest B A  //** Interpretation is that adding age to the model improved it tremendously

**Now what about the 10% rule we were talking about?

logit memory i.pa
logit memory i.pa c.age

display (.6686985- .5612989)/  .5612989  //**shows a 19% change in the coefficient

**Now lets predit and plot 

logistic memory i.pa c.age
predict prob_pa_a
 
scatter prob_pa_a age
scatter prob_pa_a pa
scatter prob_pa_a pa || line prob_pa_a pa
scatter prob_pa_a pa || line prob_pa_a pa, sort


**Lets look at effect modification with gender
**We need to explore the Gender variable first
tabulate Gender, missing
recode Gender 1=1 2=0, generate(gender)
label define gender 0"Female" 1"Male"
label values gender gender

tabulate gender memory, row col chi
tabulate gender pa, row col chi
mhodds memory pa, by(gender)

logistic memory i.pa
estimates store C
logistic memory i.pa i.gender
estimates store D
lrtest D C


logistic memory i.pa##i.gender
logistic memory i.pa##ib1.gender
margins pa##gender
marginsplot

logistic memory i.pa
estimates store E
logistic memory i.pa##i.gender
estimate store F
lrtest F E 
