library(funData)


### Name: plot.irregFunData
### Title: Plotting irregular functional data
### Aliases: plot.irregFunData plot,irregFunData,missing-method

### ** Examples

oldpar <- par(no.readonly = TRUE)

# Generate data
argvals <- seq(0,2*pi,0.01)
ind <- replicate(5, sort(sample(1:length(argvals), sample(5:10,1))))
object <- irregFunData(argvals = lapply(ind, function(i){argvals[i]}),
                  X = lapply(ind, function(i){sample(1:10,1) / 10 * argvals[i]^2}))

plot(object, main = "Irregular functional data")

par(oldpar)



