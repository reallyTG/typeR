library(chngpt)


### Name: chngptm
### Title: Estimate change point logistic model
### Aliases: chngptm chngptm.xy coef.chngptm residuals.chngptm vcov.chngptm
###   plot.chngptm print.chngptm summary.chngptm lincomb

### ** Examples


    
# threshold linear regression
dat.1=sim.chngpt("thresholded", "segmented", n=200, seed=1, beta=1, alpha=-1, x.distr="norm", e.=4,
    family="gaussian")
# default search method is fastgrid
fit.1=chngptm(formula.1=y~z, formula.2=~x, family="gaussian", dat.1, type="segmented", 
    est.method="fastgrid", var.type="bootstrap", ci.bootstrap.size=10)
summary(fit.1)
head(resid(fit.1))
plot(fit.1)
# with weights
fit.1.a=chngptm(formula.1=y~z, formula.2=~x, family="gaussian", dat.1, type="segmented", 
    est.method="fastgrid", var.type="bootstrap", weights=ifelse(dat.1$x<3.5,100,1)
    , ci.bootstrap.size=10)
summary(fit.1.a)
plot(fit.1.a)


# threshold logistic regression
dat.2=sim.chngpt("thresholded", "step", n=200, seed=1, beta=1, alpha=-1, x.distr="norm", e.=4, 
    family="binomial")

fit.2=chngptm(formula.1=y~z, formula.2=~x, family="binomial", dat.2, type="step",est.method="grid")
summary(fit.2) 
# no variance estimates available for discontinuous threshold models such as step
# vcov(fit.2$best.fit) gives the variance estimates for the best model conditional on threshold est

# also supports cbind() formula on left hand side
set.seed(1)
dat.2$success=rbinom(nrow(dat.2), 10, 1/(1 + exp(-dat.2$eta)))
dat.2$failure=10-dat.2$success
fit.2a=chngptm(formula.1=cbind(success,failure)~z, formula.2=~x, family="binomial", dat.2, 
    type="step")


# threshold Cox regression, no variance estimates available
library(survival)
dat.3 <- data.frame(time=c(4,3,1,1,2,2,3), status=c(1,1,1,0,1,1,0), x=c(0,2,1,1,1,0,0), 
    sex=c(0,0,0,0,1,1,1)) 
fit.3=chngptm(formula.1=Surv(time, status)~1, formula.2=~x, data=dat.3, family="coxph",type="step")
summary(fit.3)


# Poisson
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- as.integer(gl(3,1,9))
treatment <- gl(3,3)
print(d.AD <- data.frame(treatment, outcome, counts))
fit.4=chngptm(formula.1=counts ~ treatment, formula.2=~outcome, data=d.AD, family="poisson", 
    type="segmented", var.type="bootstrap", verbose=1, ci.bootstrap.size=10)
summary(fit.4)




## Not run: 
##D # not run because otherwise the examples take >5s and that is a problem for R CMD check
##D 
##D # an interaction model. est.method will be set to grid inside the function. fastgrid not
##D # available for models with interaction terms yet
##D fit=chngptm(formula.1=mpg~cyl + disp + hp, formula.2=~hp*drat, mtcars, type="segmented", 
##D     family="gaussian", var.type="bootstrap", ci.bootstrap.size=100)
##D summary(fit)
##D 
##D 
## End(Not run)




