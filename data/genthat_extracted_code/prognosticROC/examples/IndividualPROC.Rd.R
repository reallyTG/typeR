library(prognosticROC)


### Name: IndividualPROC
### Title: Prognostic ROC curve based on individual data
### Aliases: IndividualPROC
### Keywords: Prognostic ROC Survival Individual data Kaplan and Meier

### ** Examples


###################################################################
# example of two samples with different exponential distributions #
###################################################################

n1 <- 200
n2 <- 200
grp  <- c(rep(1, n1), rep(0, n2))
time.evt <- c(rexp(n1, rate = 1.2), rexp(n2, rate = 0.5))
time.cen <- rexp(n1+n2, rate = 0.2)
time <- pmin(time.evt, time.cen)
evt  <- 1*(time.evt < time.cen)

# Illustration of both survival curves
surv.temp <- survfit(Surv(time, evt) ~ grp) 
plot(surv.temp, lty = 2:3)

# Computation of the prognostic ROC curve
proc.result <- IndividualPROC(time, evt, grp, B=50)
  # Use B>50 for real applications
  
# Representation of the prognostic ROC curve
plot(proc.result$table$x, proc.result$table$y, type="l",
 lwd=2, xlim=c(0,1), ylim=c(0,1),
 xlab="1-Survival in the low risk group",
 ylab="1-Survival in the high risk group")
abline(c(0,0), c(1,1), lty=2)

# The corresponding 95% CI of the pessimist value
proc.result$CI.95$pessimist





