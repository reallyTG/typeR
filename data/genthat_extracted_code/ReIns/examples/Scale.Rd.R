library(ReIns)


### Name: Scale
### Title: Scale estimator
### Aliases: Scale

### ** Examples

data(secura)

# Hill estimator
H <- Hill(secura$size)

# Scale estimator
S <- Scale(secura$size, gamma=H$gamma, plot=FALSE)

# Plot logarithm of scale          
plot(S$k,log(S$A), xlab="k", ylab="log(Scale)", type="l")



