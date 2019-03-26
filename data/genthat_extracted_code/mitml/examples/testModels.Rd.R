library(mitml)


### Name: testModels
### Title: Test multiple parameters and compare nested models
### Aliases: testModels

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# * Example 1: multiparameter hypothesis test for 'ReadDis' and 'SES'
# This tests the hypothesis that both effects are zero.

require(lme4)
fit0 <- with(implist, lmer(ReadAchiev ~ (1|ID), REML=FALSE))
fit1 <- with(implist, lmer(ReadAchiev ~ ReadDis + (1|ID), REML=FALSE))

# apply Rubin's rules
testEstimates(fit1)

# multiparameter hypothesis test using D1 (default)
testModels(fit1, fit0)

# ... adjusting for finite samples
testModels(fit1, fit0, df.com=47)

# ... using D2 ("wald", using estimates and covariance-matrix)
testModels(fit1, fit0, method="D2")

# ... using D2 ("likelihood", using likelihood-ratio test)
testModels(fit1, fit0, method="D2", use="likelihood")

# ... using D3 (likelihood-ratio test, requires ML fit)
testModels(fit1, fit0, method="D3")

## Not run: 
##D # * Example 2: multiparameter test using D3 with nlme
##D 
##D # for D3 to be calculable, the 'data' argument for 'lme' must be
##D # can be constructed manually
##D 
##D require(nlme)
##D fit0 <- with(implist, lme(ReadAchiev~1, random=~1|ID,
##D   data=data.frame(ReadAchiev,ID), method="ML"))
##D fit1 <- with(implist, lme(ReadAchiev ~ 1 + ReadDis, random=~ 1|ID,
##D   data=data.frame(ReadAchiev,ReadDis,ID), method="ML"))
##D 
##D # multiparameter hypothesis test using D3
##D testModels(fit1, fit0, method="D3")
## End(Not run)



