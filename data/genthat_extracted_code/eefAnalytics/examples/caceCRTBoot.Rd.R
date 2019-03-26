library(eefAnalytics)


### Name: caceCRTBoot
### Title: Complier Average Causal Effect (CACE) Analysis of Cluster
###   Randomised Education Trials using Multilevel Model.
### Aliases: caceCRTBoot

### ** Examples

if(interactive()){

data(crtData)

######################## weighted ITT ##############################################
caceOutput<- caceCRTBoot(Posttest~ Prettest+ Intervention,
			random="School",intervention="Intervention",
			compliance = "Percentage_Attendance",nBoot=1000,data=crtData)

cace <- caceOutput$CACE
cace

Complier <- caceOutput$Compliers
Complier 

### visualising CACE effect size

plot(caceOutput)
}



