library(copula)


### Name: gasoil
### Title: Daily Crude Oil and Natural Gas Prices from 2003 to 2006
### Aliases: gasoil
### Keywords: datasets

### ** Examples

data(gasoil)
## Log Scaled  Oil & Gas Prices :
lattice :: xyplot(oil + gas ~ date, data = gasoil, auto.key=TRUE,
                  type = c("l","r"),
                  scales=list(y = list(log = TRUE), equispaced.log = FALSE))



