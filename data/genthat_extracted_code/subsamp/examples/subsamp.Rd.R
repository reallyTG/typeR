library(subsamp)


### Name: subsamp
### Title: Subsample Winner Algorithm for Variable Selection in Linear
###   Regression with a Large Number of Variables
### Aliases: subsamp
### Keywords: internal

### ** Examples

n <- 80; p <- 100
set.seed(2017)
x <- matrix(rnorm(n*p),n);
coefs <- c(.1, .5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 5)
y <- x[, 1:length(coefs)]%*%coefs + rnorm(n)
d <- data.frame(y,x)

## The number of true features in d is 10. The first 3 features,
## X1-X3, are not distinguishable from noises, while the next two
## X4 and X5 have a weak signal, X6 has a moderate signal,
## and X7-X10 have a strong signal in comparison with the noises
## in the data. A good feature selection procedure should capture
## X7-X10, at least. The ideal s here should be 10 or slightly
## bigger.

## Using the default values for m, wplot and a smaller value of s
## than desired:
subsamp(x, y, s=8, qnum=10)  #1st run
## This run captured X7-X10 and X5, with an adjusted
## R^2=0.9015.

## Next try a bigger s and include a diagnostic plot:
#  subsamp(x, y, s=10, qnum=10, wplot=TRUE) #2nd run
## It captured X5-X10, as expected from the truth.
## It is also good enough by looking at either the
## adjusted R^2, 0.955.  The diagnostic weights plot indicated that
## s=10 is a good choice.

## However, if a conservative user decided to try for an even
## bigger m and q:
#  subsamp(x, y, s=10, qnum=12, m=1200, wplot=TRUE) #3rd run
## It now definitely suggests selecting s=10, but this run only
## captured X5,X6,X8,X9,X10 without X7, and added a spurious X62,
## with a **smaller** adjusted R2 = 0.8827. Thus a user should
## now stop and conclude with using the outcome from the 2nd run.

## Regardless, if the user kept increasing both s& m, we would have
#  subsamp(x, y, s=12, qnum=12, m=1500, wplot=TRUE)  #run4
## Its outcome is same as that from run2.

## Double Assurance Procedure: This is to further assure
## the outcome, by  applying the base procedure to
## the combined features from reasonable SWA runs. Combining run1
## and run2, with and without run3, lead to the same important
## features as those from the run2:
##
#  g <- lm(formula = y ~ X8 + X10 + X9 + X6 + X5 + X95 + X61 +X20+X7+X17+X73+X82+X47,d)
#  summary(g)
#  step(g)

## We did not include the outcome from run4 into the double
## assurance procedure as its outputs is same as that of run2.



