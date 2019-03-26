library(repeated)


### Name: gnlmix
### Title: Generalized Nonlinear Regression with a Random Parameter
### Aliases: gnlmix
### Keywords: models

### ** Examples


dose <- c(9,12,4,9,11,10,2,11,12,9,9,9,4,9,11,9,14,7,9,8)
#y <- rgamma(20,shape=2+0.3*dose,scale=2)+rep(rnorm(4,0,4),rep(5,4))
y <- c(8.674419, 11.506066, 11.386742, 27.414532, 12.135699,  4.359469,
       1.900681, 17.425948,  4.503345,  2.691792,  5.731100, 10.534971,
      11.220260,  6.968932,  4.094357, 16.393806, 14.656584,  8.786133,
      20.972267, 17.178012)
resp <- restovec(matrix(y, nrow=4, byrow=TRUE), name="y")
reps <- rmna(resp, tvcov=tvctomat(matrix(dose, nrow=4, byrow=TRUE), name="dose"))

# same linear normal model with random normal intercept fitted four ways
# compare with growth::elliptic(reps, model=~dose, preg=c(0,0.6), pre=4)
glmm(y~dose, nest=individuals, data=reps)
gnlmm(reps, mu=~dose, pmu=c(8.7,0.25), psh=3.5, psd=3)
gnlmix(reps, mu=~a+b*dose+rand, random="rand", pmu=c(8.7,0.25),
	pshape=3.44, pmix=2.3)
## Not run: 
##D # gamma model with log link and random normal intercept fitted three ways
##D glmm(y~dose, family=Gamma(link=log), nest=individuals, data=reps, points=8)
##D gnlmm(reps, distribution="gamma", mu=~exp(a+b*dose), pmu=c(2,0.03),
##D 	psh=1, psd=0.3)
##D gnlmix(reps, distribution="gamma", mu=~exp(a+b*dose+rand), random="rand",
##D 	pmu=c(2,0.04), pshape=1, pmix=-2)
##D 
##D # gamma model with log link and random gamma mixtures
##D gnlmix(reps, distribution="gamma", mixture="gamma",
##D 	mu=~exp(a*rand+b*dose), random="rand", pmu=c(2,0.04),
##D 	pshape=1.24, pmix=3.5)
##D gnlmix(reps, distribution="gamma", mixture="gamma",
##D 	mu=~exp(a+b*dose)*rand, random="rand", pmu=c(2,0.04),
##D 	pshape=1.24, pmix=2.5)
## End(Not run)



