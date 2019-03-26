library(npsurv)


### Name: ap
### Title: Angina Pectoris Survival Data
### Aliases: ap
### Keywords: datasets

### ** Examples

data(ap)
r = Uhaz(ap, deg=2)           # smooth U-shaped hazard
plot(r$h, fn="h")             # hazard
plot(r$h, fn="d")             # density

# NPMLE and shape-restricted estimation
plot(npsurv(ap), fn="s")      # survival under no shape restriction
plot(r$h, fn="s", add=TRUE)   # survival with smooth U-shaped hazard



