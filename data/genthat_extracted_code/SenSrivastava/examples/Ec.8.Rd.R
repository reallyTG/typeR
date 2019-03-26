library(SenSrivastava)


### Name: Ec.8
### Title: Data on asylum requests to the U.S. by country of origen of
###   applicant
### Aliases: Ec.8
### Keywords: datasets

### ** Examples

data(Ec.8)
summary(Ec.8)
attach(Ec.8)
Ec.8.m1 <- glm(cbind(APR, DEN) ~ E + H, data=Ec.8, family=binomial)
summary(Ec.8.m1)
detach()



