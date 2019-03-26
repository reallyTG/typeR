library(cusp)


### Name: zeeman
### Title: Measurements from Zeeman's Catastrophe Machine
### Aliases: zeeman zeeman1 zeeman2 zeeman3
### Keywords: datasets

### ** Examples

data(zeeman1)
data(zeeman2)
data(zeeman3)
## Not run: 
##D fit <- cusp(y~z, alpha~x+y, beta~x+y, data=zeeman1)
##D plot(fit)
##D cusp3d(fit, surf.hue = 40, theta=215, phi=37.5, B=5.25)
## End(Not run)



