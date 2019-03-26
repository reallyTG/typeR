library(REPPlab)


### Name: plot.epplab
### Title: Plot for an epplab Object
### Aliases: plot,epplab-method plot-method plot.epplab
### Keywords: hplot methods

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)

# Plot with kernel estimator
plot(res)

# Just the best 5 and then 8
plot(res,which=c(1:5,8))

# Plot as histogram
plot(res,type="histogram")

# Plot an angles plot
plot(res,type="angles")




