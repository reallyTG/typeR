library(ATE)


### Name: nsw
### Title: Lalonde subsample of the National Supported Work Demonstration
###   Data (NSW)
### Aliases: nsw
### Keywords: datasets

### ** Examples

library(ATE)
#NSW Data example
data("nsw")

Y<- nsw$re78
X<- nsw[,c(-1,-9)]
Ti<- nsw$treat

fit1<- ATE(Y,Ti,X)
fit1
summary(fit1)
#plot(fit1)





