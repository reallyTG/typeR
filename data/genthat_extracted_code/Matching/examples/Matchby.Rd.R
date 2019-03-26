library(Matching)


### Name: Matchby
### Title: Grouped Multivariate and Propensity Score Matching
### Aliases: Matchby
### Keywords: nonparametric

### ** Examples

#
# Match exactly by racial groups and then match using the propensity score within racial groups
#

data(lalonde)

#
# Estimate the Propensity Score
#
glm1  <- glm(treat~age + I(age^2) + educ + I(educ^2) + 
             hisp + married + nodegr + re74  + I(re74^2) + re75 + I(re75^2) +
             u74 + u75, family=binomial, data=lalonde)


#save data objects
#
X  <- glm1$fitted
Y  <- lalonde$re78
Tr <- lalonde$treat

# one-to-one matching with replacement (the "M=1" option) after exactly
# matching on race using the 'by' option.  Estimating the treatment
# effect on the treated (the "estimand" option defaults to ATT).
rr  <- Matchby(Y=Y, Tr=Tr, X=X, by=lalonde$black, M=1);
summary(rr)

# Let's check the covariate balance
# 'nboots' is set to small values in the interest of speed.
# Please increase to at least 500 each for publication quality p-values.  
mb  <- MatchBalance(treat~age + I(age^2) + educ + I(educ^2) + black +
                    hisp + married + nodegr + re74  + I(re74^2) + re75 + I(re75^2) +
                    u74 + u75, data=lalonde, match.out=rr, nboots=10)




