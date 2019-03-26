library(prognosticROC)


### Name: AggregatedPROC
### Title: Prognostic ROC curve based on survival probabilities already
###   computed
### Aliases: AggregatedPROC
### Keywords: Prognostic ROC Survival

### ** Examples


# example of two survival curves using exponential distributions
time.hr <- seq(0, 600, by=5)
time.lr <- seq(0, 500, by=2)
surv.hr <- exp(-0.005*time.hr)
surv.lr <- exp(-0.003*time.lr)

# Illustration of both survival curves
plot(time.hr, surv.hr, xlab="Time (in days)",
 ylab="Patient survival", lwd=2, type="l")
lines(time.lr, surv.lr, lty=2, col=2, lwd=2)
legend("topright", c("High-Risk Group", "Low-Risk Group"), lwd=2,
 col=1:2, lty=1:2)

# Computation of the prognostic ROC curve
proc.result <- AggregatedPROC(time.lr, surv.lr, time.hr, surv.hr)

# Representation of the prognostic ROC curve
plot(proc.result$table$x, proc.result$table$y, type="l",
 lwd=2, xlim=c(0,1), ylim=c(0,1),
 xlab="1-Survival in the low risk group",
 ylab="1-Survival in the high risk group")
abline(c(0,0), c(1,1), lty=2)

# The pessimist value of the area under the curve
proc.result$auc$pessimist



