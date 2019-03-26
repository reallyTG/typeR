library(ratematrix)


### Name: plotRatematrix
### Title: Plot the distribution of evolutionary rate matrices
### Aliases: plotRatematrix

### ** Examples

## No test: 
data( centrarchidae )
dt.range <- t( apply( centrarchidae$data, 2, range ) )
## The step size for the root value can be set given the range we need to sample from:
w_mu <- ( dt.range[,2] - dt.range[,1] ) / 10
par.sd <- cbind(c(0,0), sqrt( c(1,1) ))
prior <- makePrior(r=2, p=2, par.mu=dt.range, par.sd=par.sd)
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, prior=prior
                         , gen=50000, w_mu=w_mu, dir=tempdir())
posterior <- readMCMC(handle, burn = 0.2, thin = 10)
plotRatematrix( posterior )
plotRatematrix( posterior, colors = c("black","red"))
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5)
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5, alphaDiag = 0.5)
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5, alphaDiag = 0.5)
ref.matrix <- list( rbind(c(0.5,0),c(0,0.5)), rbind(c(0.5,0),c(0,0.5)) )
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5, alphaDiag = 0.5
               , point.matrix = ref.matrix)
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5, alphaDiag = 0.5
               , point.matrix = ref.matrix, point.color = "orange", point.wd = 3)
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5, alphaDiag = 0.5
               , point.matrix = ref.matrix, point.color = "orange", point.wd = 3
               , alphaEll = 0.05, n.lines = 2000)
plotRatematrix( posterior, colors = c("black","red"), alphaOff = 0.5, alphaDiag = 0.5
               , point.matrix = ref.matrix, point.color = "orange", point.wd = 3
               , alphaEll = 0.5, n.lines = 200, hpd = 90)
## End(No test)



