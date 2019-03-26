library(intReg)


### Name: coef.intReg
### Title: Extract (only informative) coefficients, standard errors, and
###   variance-covariance matrix from 'intReg' model.
### Aliases: coef.intReg print.coef.intReg print.summary.intReg
###   summary.intReg stdEr.intReg vcov.intReg
### Keywords: methods

### ** Examples

## Example of observation-specific boundaries
## Estimate the willingness to pay for the Kakadu National Park
## Data given in intervals -- 'lower' for lower bound and 'upper' for upper bound.
## Note that dichotomous-coice answers are already coded to 'lower' and 'upper'
data(Kakadu, package="Ecdat")
set.seed(1)
Kakadu <- Kakadu[sample(nrow(Kakadu), 400),]
                        # subsample to speed up the estimation
## Estimate in log form, change 999 to Inf
lb <- log(Kakadu$lower)
ub <- Kakadu$upper
ub[ub > 998] <- Inf
ub <- log(ub)
y <- cbind(lb, ub)
m <- intReg(y ~ sex + log(income) + age + schooling + 
              recparks + jobs + lowrisk + wildlife + future + aboriginal + finben +
              mineparks + moreparks + gov +
              envcon + vparks + tvenv + major, data=Kakadu)
## You may want to compare the results to Werner (1999),
## Journal of Business and Economics Statistics 17(4), pp 479-486
print(coef(m))
print(coef(m, boundaries=TRUE))
print(nObs(m))



