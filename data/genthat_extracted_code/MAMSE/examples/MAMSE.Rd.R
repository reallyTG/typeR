library(MAMSE)


### Name: MAMSE
### Title: Minimum Averaged Mean Squared Error Weights
### Aliases: MAMSE
### Keywords: nonparametric survival multivariate univar

### ** Examples

set.seed(2009)

# MAMSE weights for univariate data
x=list(rnorm(25),rnorm(25,.1),rnorm(25,.2))
MAMSE(x)

#MAMSE weights for copulas
y=list(matrix(rnorm(150),nc=2),matrix(rnorm(150),nc=2),
   matrix(rnorm(150),nc=2))
MAMSE(y)
MAMSE(y,MCint=TRUE)

#MAMSE weights for right-censored data
z=list(cbind(rexp(50),rbinom(50,1,.5)),cbind(rexp(50,1.1),
   rbinom(50,1,.5)),cbind(rexp(50,.9),rbinom(50,1,.5)))
MAMSE(z,3,surv=TRUE)

#For more examples, see help on "MAMSE-package"



