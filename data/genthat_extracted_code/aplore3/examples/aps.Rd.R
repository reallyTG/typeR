library(aplore3)


### Name: aps
### Title: APS data
### Aliases: aps
### Keywords: datasets

### ** Examples

head(aps, n = 10)
summary(aps)


## Table 8.2 p. 274
library(nnet)
modt8.2 <- multinom(place3 ~ viol, data = aps)
summary(modt8.2)
exp(coef(modt8.2)[, "violYes"])
t(exp(confint(modt8.2)["violYes", ,]))
## To test differences between b_2 and b_1 we need the estimated variance
## covariance matrix for the fitted model (Table 8.3 p. 274). 
vcov(modt8.2) # 'raw'
## To have exactly the same output as the text we need to rearrange just a
## minimum
VarCovM <- vcov(modt8.2)[c(2, 1, 4, 3), c(2, 1, 4, 3)]
VarCovM[upper.tri(VarCovM)] <- NA
VarCovM
## Testing against null model. 
modt8.2Null <- multinom(place3 ~ 1, data = aps)
anova(modt8.2, modt8.2Null, test = "Chisq")




