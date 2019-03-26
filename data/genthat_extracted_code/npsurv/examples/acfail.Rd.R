library(npsurv)


### Name: acfail
### Title: Air Conditioner Failure Data
### Aliases: acfail
### Keywords: datasets

### ** Examples

data(acfail)
r = Uhaz(acfail, deg=2)
plot(r$h, fn="h")
plot(r$h, fn="d")



