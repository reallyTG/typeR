library(eefAnalytics)


### Name: caceSRTBoot
### Title: CACE Analysis of Simple Randomised Education Trials.
### Aliases: caceSRTBoot

### ** Examples

if(interactive()){

data(mstData)
############# weighted ITT ####################################
caceOutput3<- caceSRTBoot(Posttest~ Prettest+ Intervention,
			intervention="Intervention",
			compliance = "Percentage_Attendance",nBoot=1000,data=mstData)

cace <- caceOutput3$CACE
cace

Complier <- caceOutput3$Compliers
Complier 

### visualising CACE effect size

plot(caceOutput3)
}



