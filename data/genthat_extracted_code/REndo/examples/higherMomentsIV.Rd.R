library(REndo)


### Name: higherMomentsIV
### Title: Fitting Linear Models with Endogenous Regressors using Lewbel's
###   Higher Moments Approach
### Aliases: higherMomentsIV

### ** Examples

data("dataHigherMoments")
# P is the endogenous regressor in all examples

# 2 IVs with g*p, g=x^2, separately for each regressor X1 and X2.
hm <- higherMomentsIV(y~X1+X2+P|P|IIV(iiv=gp, g=x2, X1, X2),
                      data = dataHigherMoments)
# same as above
hm <- higherMomentsIV(y~X1+X2+P|P|IIV(iiv=gp, g=x2, X1) +
                                  IIV(iiv=gp, g=x2, X2),
                      data = dataHigherMoments)

# 3 different IVs
hm <- higherMomentsIV(y~X1+X2+P|P|IIV(iiv=y2) + IIV(iiv=yp) +
                                  IIV(iiv=g,g=x3,X1),
                      data = dataHigherMoments)

# use X2 as external IV
hm <- higherMomentsIV(y~X1+P|P|IIV(iiv=y2)+IIV(iiv=g,g=lnx,X1)| X2,
                      data = dataHigherMoments)
summary(hm)




