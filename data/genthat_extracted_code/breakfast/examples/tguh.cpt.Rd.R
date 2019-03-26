library(breakfast)


### Name: tguh.cpt
### Title: Multiple change-point detection in the mean of a vector using
###   the TGUH method
### Aliases: tguh.cpt

### ** Examples

stairs <- rep(1:50, each=10)
stairs.noisy <- stairs + rnorm(500)/5
stairs.cleaned <- tguh.cpt(stairs.noisy)
ts.plot(stairs.cleaned$est)
stairs.cleaned$no.of.cpt
stairs.cleaned$cpt



