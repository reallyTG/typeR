library(epiDisplay)


### Name: cc
### Title: Odds ratio calculation and graphing
### Aliases: cc cci cs csi make2x2 graph.casecontrol graph.prospective
###   labelTable
### Keywords: array

### ** Examples

data(Oswego)
.data <- Oswego
attach(.data)
cc(ill, chocolate)
cc(ill, chocolate, design="case-control")
cs(ill, chocolate) # The outcome variable should come first.

#    For the following table
#          chocolate
#    ill     FALSE TRUE
#     FALSE     7   22
#     TRUE     20   25
#
cci(25, 22, 20, 7)
graph.casecontrol(25, 22, 20, 7)
graph.prospective(25, 22, 20, 7)
# Each of the above two lines produces untitled graph, which can be decorated
# additionally decorated

#Alternatively
table1 <- make2x2(25,22,20,7)
cc(outcome=NULL, exposure=NULL, cctable=table1)
cs(outcome=NULL, exposure=NULL, cctable=table1)
agegr <- pyramid(age, sex, bin=30)$ageGroup
cs(ill, agegr, main="Risk ratio by age group", xlab="Age (years)")
rm(list=ls())
detach(.data)



