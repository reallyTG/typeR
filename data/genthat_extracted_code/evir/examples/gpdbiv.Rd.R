library(evir)


### Name: gpdbiv
### Title: Implements Bivariate POT Method
### Aliases: gpdbiv
### Keywords: models

### ** Examples

data(bmw) ; data(siemens)
out <- gpdbiv(-bmw, -siemens, ne1 = 100, ne2 = 100)
interpret.gpdbiv(out, 0.05, 0.05)
## Not run: plot(out) 



