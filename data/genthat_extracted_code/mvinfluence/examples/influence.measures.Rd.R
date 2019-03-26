library(mvinfluence)


### Name: influence.measures
### Title: Regression Deletion Diagnostics for Multivariate Linear Models
### Aliases: cooks.distance.mlm hatvalues.mlm
### Keywords: models regression

### ** Examples

data(Rohwer, package="heplots")
Rohwer2 <- subset(Rohwer, subset=group==2)
rownames(Rohwer2)<- 1:nrow(Rohwer2)
Rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n+s+ns+na+ss, data=Rohwer2)

hatvalues(Rohwer.mod)
cooks.distance(Rohwer.mod)




