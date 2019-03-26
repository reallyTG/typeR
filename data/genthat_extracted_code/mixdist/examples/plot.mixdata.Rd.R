library(mixdist)


### Name: plot.mixdata
### Title: Mixdata Object Plotting
### Aliases: plot.mixdata
### Keywords: dplot

### ** Examples

data(cassie)
as.mixdata(cassie) # if the result isn't `NULL', then cassie is mixed data
plot.mixdata(cassie)
data(pikeraw)
data(pikepar)
pikemd <- mixgroup(pikeraw, breaks = c(0, seq(19.75, 65.75, 2), 80))
plot(pikemd)
plot(pikemd, pikepar, "lnorm")
fit <- mix(pikemd, pikepar, "lnorm", constr = mixconstr(consigma = "CCV"), emsteps = 3)
plot(fit)
plot(pikemd, pikepar, "lnorm", root = TRUE)
plot(fit, root = TRUE)



