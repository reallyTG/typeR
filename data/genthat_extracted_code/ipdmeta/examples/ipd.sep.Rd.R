library(ipdmeta)


### Name: ipd.sep
### Title: IPD meta-analysis Subgroup Effect Power Estimator
### Aliases: ipd.sep

### ** Examples


data(poynard)

#AGE SEP FOR IPD META-ANALYSIS OF BETA-ANTAGONISTS TO PREVENT GI BLEEDING EVENTS

#ALTERNATIVE HYPOTHESIS FOR AGE-TREATMENT EFFECT
#WITH 10 YEARS CHANGE TO OR TREATMENT EFFECT exp(beta*10)
#EFFECT MODIFIER CHANGES TREATMENT EFFECT BY 30%

beta = log(1.3)/10

age.sep <- 

ipd.sep(
 effect=beta,
 event0=bleed0,
 event1=bleed1,
 n0=n0,
 n1=n1,
 x0=age0,
 x1=age1,
 s20=age.s20,
 s21=age.s21,
 data=poynard
)

age.sep

#GENDER SUBGROUP EFFECT; 30% OR CHANGE BY GENDER

beta <- log(1.3)

gender.sep <- 

ipd.sep(
 effect=beta,
 event0=bleed0,
 event1=bleed1,
 n0=n0,
 n1=n1,
 x0=male0,
 x1=male1,
 data=poynard
)

gender.sep





