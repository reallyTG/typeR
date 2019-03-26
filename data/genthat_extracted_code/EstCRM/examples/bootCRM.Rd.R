library(EstCRM)


### Name: bootCRM
### Title: Computing Standard Errors for Item Parameter Estimates using
###   Bootstrap Sampling
### Aliases: bootCRM

### ** Examples


##load the dataset EPIA
data(EPIA)

#Please assign a larger number (e.g.,50,100) to "R" in the code below.

bootCRM(data=EPIA,
max.item=c(112,112,112,112,112),
min.item=c(0,0,0,0,0),
max.EMCycle=200,
converge=.01,
nsample=3)


##load the dataset SelfEff
data(SelfEff)

#Please assign a larger number (e.g.,50,100) to "R" in the code below.

bootCRM(data=SelfEff,
max.item=c(11,11,11,11,11,11,11,11,11,11),
min.item=c(0,0,0,0,0,0,0,0,0,0),
max.EMCycle=200,
converge=.01,
nsample=3)




