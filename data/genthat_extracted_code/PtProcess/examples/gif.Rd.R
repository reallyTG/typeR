library(PtProcess)


### Name: gif
### Title: General Notes on Ground Intensity Functions
### Aliases: gif
### Keywords: documentation

### ** Examples

#  Ogata's Data: ground intensity function
#  evaluate lambda_g(t) at certain times

data(Ogata)

p <- c(0.02, 70.77, 0.47, 0.002, 1.25)
times <- sort(c(seq(0, 800, 0.5), Ogata$time))
TT <- c(0, 800)

plot(times, log(etas_gif(Ogata, times, params=p)), type="l",
     ylab=expression(paste(log, " ", lambda[g](t))),
     xlab=expression(t), xlim=TT)

#  Evaluate the integral
#   The first form below is where the arguments are in their
#   default positions, the 2nd is where they are not, hence
#   their names must be specified

print(etas_gif(Ogata, NULL, p, TT))
#  or
print(etas_gif(Ogata, params=p, TT=TT))



