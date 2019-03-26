library(robreg3S)


### Name: simulation-tools
### Title: Data generator for simulation study on cell- and case-wise
###   contamination
### Aliases: generate.randbeta generate.cellcontam.regress
###   generate.casecontam.regress generate.cellcontam.regress.dummies
###   generate.casecontam.regress.dummies

### ** Examples

##################################################
## Cellwise contaminated data simulation 
## (continuous covariates only)
set.seed(10)
b <- 10*generate.randbeta(p=15)
A <- generate.randcorr(cond=100, p=15)
dat <- generate.cellcontam.regress(n=300, p=15, A=A, sigma=0.5, b=b, k=10, cp=0.05)

## LS
fit.LS <- lm( y ~ x, dat)
mean((coef(fit.LS)[-1] - b)^2)

## MM regression
fit.MM <- robustbase::lmrob( y ~ x, dat)
mean((coef(fit.MM)[-1] - b)^2)

## 3S regression
fit.3S <- robreg3S( y=dat$y, x=dat$x, init="imputed")
mean((coef(fit.3S)[-1] - b)^2)



##################################################
## Casewise contaminated data simulation
## (continuous covariates only)
set.seed(10)
b <- 10*generate.randbeta(p=10)
A <- generate.randcorr(cond=100, p=10)
dat <- generate.casecontam.regress(n=200, p=10, A=A, sigma=0.5, b=b, l=8, k=10, cp=0.10)

## LS
fit.LS <- lm( y ~ x, dat)
mean((coef(fit.LS)[-1] - b)^2)

## MM regression
fit.MM <- robustbase::lmrob( y ~ x, dat)
mean((coef(fit.MM)[-1] - b)^2)

## 3S regression
fit.3S <- robreg3S( y=dat$y, x=dat$x, init="imputed")
mean((coef(fit.3S)[-1] - b)^2)


## Not run: 
##D ##################################################
##D ## Cellwise contaminated data simulation 
##D ## (continuous and dummies covariates)
##D set.seed(10)
##D b <- 10*generate.randbeta(p=15)
##D A <- generate.randcorr(cond=100, p=15)
##D dat <- generate.cellcontam.regress.dummies(n=300, p=12, pd=3, 
##D    probd=c(1/2,1/3,1/4), A=A, sigma=0.5, b=b, k=10, cp=0.05)
##D 
##D ## LS
##D fit.LS <- lm( dat$y ~ dat$x + dat$dummies)
##D mean((coef(fit.LS)[-1] - b)^2)
##D 
##D ## MM regression
##D fit.MM <- robustbase::lmrob( dat$y ~ dat$x + dat$dummies)
##D mean((coef(fit.MM)[-1] - b)^2)
##D 
##D ## 3S regression
##D fit.3S <- robreg3S( y=dat$y, x=dat$x, dummies=dat$dummies, init="imputed")
##D mean((coef(fit.3S)[-1] - b)^2)
##D 
##D 
##D ##################################################
##D ## Casewise contaminated data simulation 
##D ## (continuous and dummies covariates)
##D set.seed(10)
##D b <- 10*generate.randbeta(p=15)
##D A <- generate.randcorr(cond=100, p=15)
##D dat <- generate.casecontam.regress.dummies(n=300, p=12, pd=3, 
##D    probd=c(1/2,1/3,1/4), A=A, sigma=0.5, b=b, l=7, k=10, cp=0.10)
##D 
##D ## LS
##D fit.LS <- lm( dat$y ~ dat$x + dat$dummies)
##D mean((coef(fit.LS)[-1] - b)^2)
##D 
##D ## MM regression
##D fit.MM <- robustbase::lmrob( dat$y ~ dat$x + dat$dummies)
##D mean((coef(fit.MM)[-1] - b)^2)
##D 
##D ## 3S regression
##D fit.3S <- robreg3S( y=dat$y, x=dat$x, dummies=dat$dummies, init="imputed")
##D mean((coef(fit.3S)[-1] - b)^2)
##D 
## End(Not run)



