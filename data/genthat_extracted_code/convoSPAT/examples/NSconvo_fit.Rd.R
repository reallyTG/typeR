library(convoSPAT)


### Name: NSconvo_fit
### Title: Fit the nonstationary spatial model
### Aliases: NSconvo_fit

### ** Examples

# Using white noise data
fit.model <- NSconvo_fit( coords = cbind( runif(100), runif(100)),
data = rnorm(100), fit.radius = 0.4, N.mc = 4 )




