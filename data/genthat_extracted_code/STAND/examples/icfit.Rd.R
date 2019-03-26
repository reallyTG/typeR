library(STAND)


### Name: icfit
### Title: Calculates the Self-Consistent Estimate of Survival from
###   Interval Censored Data
### Aliases: icfit
### Keywords: nonparametric

### ** Examples

# Calculate and plot a Kaplan-Meier type curve for interval censored data.
# This is S(x) = 1 - F(x) and is the sample estimate of the probability
# of exceeding x.  The filmbadge data is used as an example.
data(filmbadge)
out <- icfit(filmbadge$dlow,filmbadge$dhigh)
icplot(out$surv, out$time,XLAB="Dose",YLAB="Exceedance Probability")



