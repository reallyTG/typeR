library(bfp)


### Name: constructNewdataMatrix
### Title: Construct the model matrix for new data based on an existing
###   BayesMfp object
### Aliases: constructNewdataMatrix
### Keywords: internal utilities

### ** Examples

## construct a BayesMfp object
set.seed(19)

x1 <- rnorm (n=15)
x2 <- rbinom (n=15, size=20, prob=0.5) 
x3 <- rexp (n=15)

y <- rt (n=15, df=2)

test <- BayesMfp (y ~ bfp (x2, max = 4) + uc (x1 + x3), nModels = 200, method="exhaustive")

## some new covariate data
newdata <- data.frame(x1 = 1:10, x2 = rbinom(n=10, size=20, prob=0.6),
x3 = 2:11)

## construct the new design matrix:
newmatrix <- bfp:::constructNewdataMatrix(BayesMfpObject=test, newdata=newdata)

## check the result:
stopifnot(identical(newmatrix,
                    structure(c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.6,
				1.2, 1.2, 1.2,  1.3, 1.3, 1.4, 1.1,
				1.2, 1.1, 1, 2, 3, 4, 5, 6, 7, 8, 9,
				10,  2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
				.Dim = c(10L, 4L),
				.Dimnames =
                                 list(c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"),
				      c("(Intercept)", "x2", "x1", "x3")),
				assign = 0:3)))



