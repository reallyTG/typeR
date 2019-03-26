library(DAMisc)


### Name: intEff
### Title: Functions for Estimating Interaction Effects in Logit and Probit
###   Models
### Aliases: intEff

### ** Examples

data(france)
mod <- glm(voteleft ~ age*lrself + retnat + male, data=france, family=binomial)
out <- intEff(obj=mod, vars=c("age", "lrself"), data=france)
plot(out$phat, out$int_eff, xlab="Predicted Pr(Y=1|X)", 
	ylab = "Interaction Effect")
ag <- aggregate(out$linear, list(out$phat), mean)
lines(ag[,1], ag[,2], lty=2, col="red", lwd=2)
legend("topright", c("Correct Marginal Effect", "Linear Marginal Effect"), 
	pch=c(1, NA), lty=c(NA, 2), col=c("black", "red"), lwd=c(NA, 2), inset=.01)



