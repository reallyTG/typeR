library(breakfast)


### Name: segment.mean
### Title: Multiple change-point detection in the mean of a vector
### Aliases: segment.mean

### ** Examples

stairs <- rep(1:50, each=10)
stairs.noisy <- stairs + rnorm(500)/5
stairs.cleaned <- segment.mean(stairs.noisy)
ts.plot(stairs.cleaned$est)
stairs.cleaned$no.of.cpt
stairs.cleaned$cpt



