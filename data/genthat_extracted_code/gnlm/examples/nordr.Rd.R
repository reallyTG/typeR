library(gnlm)


### Name: nordr
### Title: Nonlinear Ordinal Regression Models
### Aliases: nordr
### Keywords: models

### ** Examples


# McCullagh (1980) JRSS B42, 109-142
# tonsil size: 2x3 contingency table
y <- c(0:2,0:2)
carrier <- c(rep(0,3),rep(1,3))
carrierf <- gl(2,3,6)
wt <- c(19,29,24,
	497,560,269)
pmu <- c(-1,0.5)
mu <- function(p) c(rep(p[1],3),rep(p[1]+p[2],3))
# proportional odds
# with mean function
nordr(y, dist="prop", mu=mu, pmu=pmu, weights=wt, pintercept=1.5)
# using Wilkinson and Rogers notation
nordr(y, dist="prop", mu=~carrierf, pmu=pmu, weights=wt, pintercept=1.5)
# using formula with unknowns
nordr(y, dist="prop", mu=~b0+b1*carrier, pmu=pmu, weights=wt, pintercept=1.5)
# continuation ratio
nordr(y, dist="cont", mu=mu, pmu=pmu, weights=wt, pintercept=1.5)
# adjacent categories
nordr(y, dist="adj", mu=~carrierf, pmu=pmu, weights=wt, pintercept=1.5)
#
# Haberman (1974) Biometrics 30, 589-600
# institutionalized schizophrenics: 3x3 contingency table
y <- rep(0:2,3)
fr <- c(43,6,9,
	16,11,18,
	3,10,16)
length <- gl(3,3)
## Not run: 
##D # fit continuation ratio model with nordr and as a logistic model
##D nordr(y, mu=~length, weights=fr, pmu=c(0,-1.4,-2.3), pint=0.13,
##D 	dist="cont")
##D 	
## End(Not run)
# logistic regression with reconstructed table
frcr <- cbind(c(43,16,3,49,27,13),c(6,11,10,9,18,16))
lengthord <- gl(3,1,6)
block <- gl(2,3)
summary(glm(frcr~lengthord+block,fam=binomial))
# note that AICs and deviances are different




