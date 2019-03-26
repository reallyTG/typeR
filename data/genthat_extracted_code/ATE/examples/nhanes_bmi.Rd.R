library(ATE)


### Name: nhanes_bmi
### Title: Subsample of National Health and Nutritional Examination Survey
###   for School Children
### Aliases: nhanes_bmi
### Keywords: datasets

### ** Examples

library(ATE)
data("nhanes_bmi")

Y<-nhanes_bmi[1:500,1]
treat<-nhanes_bmi[1:500,2]
X<-nhanes_bmi[1:500,-c(1,2)]

fit1<- ATE(Y,treat,X)
fit1
summary(fit1)
#plot(fit1)





