library(ReIns)


### Name: Scale.2o
### Title: Bias-reduced scale estimator using second order Hill estimator
### Aliases: Scale.2o

### ** Examples

data(secura)

# Hill estimator
H <- Hill(secura$size)
# Bias-reduced Hill estimator
H2o <- Hill.2oQV(secura$size)

# Scale estimator
S <- Scale(secura$size, gamma=H$gamma, plot=FALSE)
# Bias-reduced scale estimator
S2o <- Scale.2o(secura$size, gamma=H2o$gamma, b=H2o$b, 
          beta=H2o$beta, plot=FALSE)

# Plot logarithm of scale             
plot(S$k,log(S$A), xlab="k", ylab="log(Scale)", type="l")
lines(S2o$k,log(S2o$A), lty=2)



