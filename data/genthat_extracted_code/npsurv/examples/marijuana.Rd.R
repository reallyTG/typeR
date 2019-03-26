library(npsurv)


### Name: marijuana
### Title: Angina Pectoris Survival Data
### Aliases: marijuana
### Keywords: datasets

### ** Examples

data(marijuana)
r = Uhaz(marijuana, deg=2)
plot(r$h, fn="h")
plot(r$h, fn="s")



