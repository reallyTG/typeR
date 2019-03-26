library(OutrankingTools)


### Name: Electre_1
### Title: Electre 1 : Method used to solve multiple criteria decision
###   making
### Aliases: Electre_1
### Keywords: ~kwd1 ~kwd2

### ** Examples


## This illustrative example has been used in to present 
##the ELECTRE III-IV software in the French version.
## The objective is to make the ranking of 10 French cars that were evaluated on 7 criteria 
##(VALLE E, D. AND ZIELNIEWICZ, P. (1994a). 
## Document du LAMSADE 85, Universite Paris-Dauphine,Paris.)

## The performance table

performanceMatrix <- cbind(
c(103000,101300,156400,267400,49900,103600,103000,170100,279700,405000),
c(171.3,205.3,221.7,230.7,122.6,205.1,178.0,226.0,233.8,265.0),
c(7.65,7.90,7.90,10.50,8.30,8.20,7.20,9.10,10.90,10.30),
c(352,203,391,419,120,265,419,419,359,265),
c(11.6,8.4,8.4,8.6,23.7,8.1,11.4,8.1,7.8,6.0), 	
c(88.0,78.3,81.5,64.7,74.1,81.7,77.6,74.7,75.5,74.7),
c(69.7,73.4,69.0,65.6,76.4,73.6,66.2,71.7,70.9,72.0))

## Vector containing names of alternatives

alternatives <-c("CBX16","P205G","P405M","P605S","R4GTL","RCLIO","R21TS","R21TU","R25BA","ALPIN")

## Vector containing names of criteria

criteria <-c("Prix","Vmax","C120","Coff","Acce","Frei","Brui")
##  vector indicating the direction of the criteria evaluation .
minmaxcriteria <-c("min","max","min","max","min","min","min")

## criteriaWeights vector
criteriaWeights <- c(0.3,0.1,0.3,0.2,0.1,0.2,0.1)

Electre_1(performanceMatrix,
alternatives,
criteria,
criteriaWeights,
minmaxcriteria,
concordance_threshold=0.8,discordance_threshold=0.1)



