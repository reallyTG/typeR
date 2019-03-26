library(evir)


### Name: plot.gpdbiv
### Title: Plot Fitted Bivariate GPD Model
### Aliases: plot.gpdbiv
### Keywords: hplot

### ** Examples

data(bmw) ; data(siemens)
out <- gpdbiv(-bmw, -siemens, ne1 = 100, ne2 = 100) 
## Not run: plot(out)
 
## Not run: Make a plot selection (or 0 to exit): 
## Not run: 1: plot: Exceedance data
## Not run: 2: plot: Contours of Bivariate Distribution Function
## Not run: 3: plot: Contours of Bivariate Survival Function 
## Not run: 4: plot: Tail of Marginal 1 
## Not run: 5: plot: Tail of Marginal 2 



