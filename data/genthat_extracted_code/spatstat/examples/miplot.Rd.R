library(spatstat)


### Name: miplot
### Title: Morisita Index Plot
### Aliases: miplot
### Keywords: spatial nonparametric

### ** Examples

 data(longleaf)
 miplot(longleaf)
 opa <- par(mfrow=c(2,3))
 data(cells)
 data(japanesepines)
 data(redwood)
 plot(cells)
 plot(japanesepines)
 plot(redwood)
 miplot(cells)
 miplot(japanesepines)
 miplot(redwood)
 par(opa)



