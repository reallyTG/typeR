library(mvinfluence)


### Name: mlm.influence
### Title: Calculate Regression Deletion Diagnostics for Multivariate
###   Linear Models
### Aliases: mlm.influence
### Keywords: models regression multivariate

### ** Examples

Rohwer2 <- subset(Rohwer, subset=group==2)
rownames(Rohwer2)<- 1:nrow(Rohwer2)
Rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ n+s+ns+na+ss, data=Rohwer2)
Rohwer.mod
influence(Rohwer.mod)

# Sake data
Sake.mod <- lm(cbind(taste,smell) ~ ., data=Sake)
influence(Sake.mod)




