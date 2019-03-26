library(CPE)


### Name: phcpe
### Title: Gonen & Heller Concordance Probability Estimate for the Cox
###   Proportional Hazards model
### Aliases: phcpe
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

### Calculate CPE only (needs much less time).
phcpe(coxph.fit)
phcpe(coxph.fit,out.ties=TRUE)
#result is identical because the covariates are not tied #

### Calculate CPE and CPE.SE
phcpe(coxph.fit, CPE.SE=TRUE)
phcpe(coxph.fit, CPE.SE=TRUE,out.ties=TRUE)

#*** For unknown reason, 'coxph.fit' may need to be removed before running cph()***
rm(coxph.fit)

cph.fit <- cph(Surv(time, status)~x1+x2+x3, data=survd,method="breslow")

### Calculate CPE only (needs much less time).
phcpe(cph.fit)
phcpe(cph.fit,out.ties=TRUE)

### Calculate CPE and CPE.SE
phcpe(cph.fit, CPE.SE=TRUE)
phcpe(cph.fit, CPE.SE=TRUE,out.ties=TRUE)




