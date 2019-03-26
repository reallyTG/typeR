library(idr)


### Name: get.correspondence
### Title: Compute correspondence profiles
### Aliases: get.correspondence
### Keywords: Statistical models

### ** Examples


# salmon data 
data(salmon)

# get.correspondence() needs the observations with high ranks have 
# high correlation and the observations with low ranks have low correlation. 
# In this dataset, small values have high correlation and large values 
# have low correlation.
# Ranking negative values makes the data follow the structure required
# by get.correspondence().
# There are 28 observations in this data set.

rank.x <- rank(-salmon$spawners)
rank.y <- rank(-salmon$recruits)
uv <- get.correspondence(rank.x, rank.y, seq(0.01, 0.99, by=1/28)) 


# plot correspondence curve on the scale of percentage
plot(uv$psi$t, uv$psi$value, xlab="t", ylab="psi", xlim=c(0, max(uv$psi$t)), 
ylim=c(0, max(uv$psi$value)), cex.lab=2)
lines(uv$psi$smoothed.line, lwd=4)
abline(coef=c(0,1), lty=3)

# plot the derivative of correspondence curve on the scale of percentage
plot(uv$dpsi$t, uv$dpsi$value, xlab="t", ylab="psi'", xlim=c(0, max(uv$dpsi$t)),
ylim=c(0, max(uv$dpsi$value)), cex.lab=2)
lines(uv$dpsi$smoothed.line, lwd=4)
abline(h=1, lty=3)

# plot correspondence curve on the scale of the number of observations
plot(uv$psi.n$t, uv$psi.n$value, xlab="t", ylab="psi", xlim=c(0, max(uv$psi.n$t)), 
ylim=c(0, max(uv$psi.n$value)), cex.lab=2)
lines(uv$psi.n$smoothed.line, lwd=4)
abline(coef=c(0,1), lty=3)

# plot the derivative of correspondence curve on the scale of the number
# of observations
plot(uv$dpsi.n$t, uv$dpsi.n$value, xlab="t", ylab="psi'", xlim=c(0, max(uv$dpsi.n$t)), 
ylim=c(0, max(uv$dpsi.n$value)), cex.lab=2)
lines(uv$dpsi.n$smoothed.line, lwd=4)
abline(h=1, lty=3)

# If the rank lists consist of a large number of ties at the bottom
# (e.g. the same low value is imputed to the list for the observations
# that appear on only one list), it may be desirable to plot only
# observations before hitting the ties. Then it can be plotted using the
# following
plot(uv$psi$t[1:uv$psi$jump.point], uv$psi$value[1:uv$psi$jump.point], xlab="t",
ylab="psi", xlim=c(0, max(uv$psi$t[1:uv$psi$jump.point])), 
ylim=c(0, max(uv$psi$value[1:uv$psi$jump.point])), cex.lab=2)
lines(uv$psi$smoothed.line, lwd=4)
abline(coef=c(0,1), lty=3)
 



