library(ACSWR)


### Name: yb
### Title: Youden and Beale's Data on Lesions of Half-Leaves of Tobacco
###   Plant
### Aliases: yb
### Keywords: exploratory data analysis

### ** Examples

data(yb)
summary(yb)
quantile(yb$Preparation_1,seq(0,1,.1)) # here seq gives 0, .1, .2, ...,1
quantile(yb$Preparation_2,seq(0,1,.1))
fivenum(yb$Preparation_1)
fivenum(yb$Preparation_2)



