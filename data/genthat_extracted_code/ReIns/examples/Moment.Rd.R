library(ReIns)


### Name: Moment
### Title: Moment estimator
### Aliases: Moment

### ** Examples

data(soa)

# Hill estimator
H <- Hill(soa$size, plot=FALSE)
# Moment estimator
M <- Moment(soa$size)
# Generalised Hill estimator
gH <- genHill(soa$size, gamma=H$gamma)

# Plot estimates
plot(H$k[1:5000], M$gamma[1:5000], xlab="k", ylab=expression(gamma), type="l", ylim=c(0.2,0.5))
lines(H$k[1:5000], gH$gamma[1:5000], lty=2)
legend("topright", c("Moment", "Generalised Hill"), lty=1:2)



