library(CPE)


### Name: phcpe2
### Title: Gonen & Heller Concordance Probability Estimate for the Cox
###   Proportional Hazards model
### Aliases: phcpe2
### Keywords: survival

### ** Examples


### create a simple data set for testing
set.seed(199)
nn <- 1000
time <- rexp(nn)
status <- sample(0:1, nn, replace=TRUE)
covar <- matrix(rnorm(3*nn), ncol=3)
survd <- data.frame(time, status, covar)
names(survd) <- c("time","status","x1","x2","x3")

coxph.fit <- coxph(Surv(time,status)~x1+x2+x3,data=survd)

phcpe(coxph.fit,CPE.SE=TRUE)
phcpe2(coef=coxph.fit$coefficients,coef.var=coxph.fit$var,design=model.matrix(coxph.fit))

#*** For unknown reason, 'coxph.fit' may need to be removed before running cph()***
rm(coxph.fit)

cph.fit <- cph(Surv(time, status)~x1+x2+x3, data=survd,method="breslow")

### Calculate CPE only (needs much less time).
phcpe2(cph.fit$coefficients,coef.var=cph.fit$var,design=model.matrix(cph.fit),CPE.SE=TRUE)




