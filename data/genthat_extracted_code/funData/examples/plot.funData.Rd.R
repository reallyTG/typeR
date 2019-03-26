library(funData)


### Name: plot.funData
### Title: Plotting univariate functional data
### Aliases: plot.funData plot,funData,missing-method

### ** Examples

oldpar <- par(no.readonly = TRUE)

# One-dimensional
argvals <- seq(0,2*pi,0.01)
object <- funData(argvals,
                   outer(seq(0.75, 1.25, length.out = 11), sin(argvals)))

plot(object, main = "One-dimensional functional data")

# Two-dimensional
X <- array(0, dim = c(2, length(argvals), length(argvals)))
X[1,,] <- outer(argvals, argvals, function(x,y){sin((x-pi)^2 + (y-pi)^2)})
X[2,,] <- outer(argvals, argvals, function(x,y){sin(2*x*pi) * cos(2*y*pi)})
object2D <- funData(list(argvals, argvals), X)

plot(object2D, main = "Two-dimensional functional data (obs 1)", obs = 1)
plot(object2D, main = "Two-dimensional functional data (obs 2)", obs = 2)
## Not run: plot(object2D, main = "Two-dimensional functional data") # must specify obs!

## No test: 
### More examples ###
par(mfrow = c(1,1))

# using plotNA
if(requireNamespace("zoo", quietly = TRUE))
{
objectMissing <- funData(1:5, rbind(c(1, NA, 5, 4, 3), c(10, 9, NA, NA, 6)))
par(mfrow = c(1,2))
plot(objectMissing, type = "b", pch = 20, main = "plotNA = FALSE") # the default
plot(objectMissing, type = "b", pch = 20, plotNA = TRUE, main = "plotNA = TRUE") # requires zoo
}

# Changing colors
plot(object, main = "1D functional data in grey", col = "grey")
plot(object, main = "1D functional data in heat.colors", col = heat.colors(nObs(object)))

plot(object2D, main = "2D functional data in topo.colors", obs = 1, col = topo.colors(64))
par(oldpar)
## End(No test)



