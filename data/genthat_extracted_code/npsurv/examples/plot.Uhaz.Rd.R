library(npsurv)


### Name: plot.Uhaz
### Title: Plot Functions for U-shaped Hazard Estimation
### Aliases: plot.Uhaz plot.uh plothazuh plotchazuh plotsurvuh plotdenuh
###   plotgraduh
### Keywords: function

### ** Examples

## Angina Pectoris Survival Data
data(ap)
plot(r<-Uhaz(ap))              # hazard function for a convex hazard
plot(r, fn="c")                # cumulative hazard function
plot(r, fn="s")                # survival function
plot(r, fn="d")                # density function
plot(r, ap, fn="g")            # gradient functions
plot(r, ap, fn="g", order=1)   # first derivatives of gradient functions
plot(r, ap, fn="g", order=2)   # second derivatives of gradient functions

## New Zealand Mortality in 2000
data(nzmort)
i = nzmort$ethnic == "maori"
x = nzmort[i,1:2]                            # Maori mortality
h = Uhaz(x[,1]+0.5, x[,2], deg=2)$h          # smooth U-shaped hazard
plot(h)                        # hazard function
plot(h, fn="d")                # density function
plot(h, fn="s")                # survival function

x2 = nzmort[!i,1:2]                          # Non-Maori mortality
h2 = Uhaz(x2[,1]+0.5, x2[,2], deg=2)$h
plot(h2, fn="s", add=TRUE, col="green3")



