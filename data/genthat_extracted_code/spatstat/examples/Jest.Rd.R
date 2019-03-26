library(spatstat)


### Name: Jest
### Title: Estimate the J-function
### Aliases: Jest
### Keywords: spatial nonparametric

### ** Examples

   data(cells)
   J <- Jest(cells, 0.01)
   plot(J, main="cells data")
   # values are far above J = 1, indicating regular pattern

   data(redwood)
   J <- Jest(redwood, 0.01, legendpos="center")
   plot(J, main="redwood data")
   # values are below J = 1, indicating clustered pattern



