library(waveband)


### Name: wave.band
### Title: Posterior credible intervals for wavelet regression
### Aliases: wave.band
### Keywords: manip

### ** Examples

#library(wavethresh)
#
# First, look at the piecewise polynomial example.
#
# This plot and the plots for the smooth example below show
# the data as points, the BayesThresh estimate (thick line), 
# pointwise 99 percent credible intervals (thin lines), and
# the true function (dotted thin line).
#
ppoly.wb <- wave.band(type = "ppoly", n = 1024, rsnr=4)
#
# Plotting the cumulants shows that there are significant 
# third and fourth cumulants in some places.
#
t <- (1:1024)/1024
plot(t, ppoly.wb$cumulants$one, type="l", xlab="t", ylab = "one")
plot(t, ppoly.wb$cumulants$two, type="l", xlab="t", ylab = "two")
plot(t, ppoly.wb$cumulants$three, type="l", xlab="t", ylab = "three")
plot(t, ppoly.wb$cumulants$four, type="l", xlab="t", ylab = "four")
#
# Now consider how much difference the prior can make.
# Consider a smooth example, first using the default prior,
# and then using a smoother prior.
#

gs <- sin(2*pi*t) + 2*(t - 0.5)^2
gs.noisy <- gs + rnorm(n=1024, sd=sqrt(var(gs))/2)
gs.wb1 <- wave.band(data=gs.noisy)

gs.wb2 <- wave.band(data=gs.noisy, alpha=4, beta=1)



