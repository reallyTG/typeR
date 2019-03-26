library(POT)


### Name: Fit the GP Distribution
### Title: Fitting a GPD to Peaks Over a Threshold
### Aliases: fitgpd
### Keywords: htest

### ** Examples

x <- rgpd(200, 1, 2, 0.25)
mle <- fitgpd(x, 1, "mle")$param
pwmu <- fitgpd(x, 1, "pwmu")$param
pwmb <- fitgpd(x, 1, "pwmb")$param
pickands <- fitgpd(x, 1, "pickands")$param    ##Check if Pickands estimates
                                              ##are valid or not !!!
med <- fitgpd(x, 1, "med",                    ##Sometimes the fitting algo is not
start = list(scale = 2, shape = 0.25))$param  ##accurate. So specify
                                              ##good starting values is
                                              ##a good idea.  
mdpd <- fitgpd(x, 1, "mdpd")$param
lme <- fitgpd(x, 1, "lme")$param
mple <- fitgpd(x, 1, "mple")$param
ad2r <- fitgpd(x, 1, "mgf", stat = "AD2R")$param

print(rbind(mle, pwmu, pwmb, pickands, med, mdpd, lme,
 mple, ad2r))

##Use PWM hybrid estimators
fitgpd(x, 1, "pwmu", hybrid = FALSE)

##Now fix one of the GPD parameters
##Only the MLE, MPLE and MGF estimators are allowed !
fitgpd(x, 1, "mle", scale = 2)
fitgpd(x, 1, "mple", shape = 0.25) 



