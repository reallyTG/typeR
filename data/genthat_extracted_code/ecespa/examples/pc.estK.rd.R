library(ecespa)


### Name: pc.estK
### Title: Fit the Poisson Cluster Point Process by Minimum Contrast
### Aliases: pc.estK Kclust
### Keywords: spatial

### ** Examples



data(gypsophylous)


# set the number of simulations (nsim=199 or larger for real analyses)
nsim<- 19

## Estimate K function ("Kobs").

gyps.env <- envelope(gypsophylous, Kest, correction="iso", nsim=nsim)

plot(gyps.env, sqrt(./pi)-r~r, legend=FALSE)

## Fit Poisson Cluster Process. The limits of integration 
## rmin and rmax are setup to 0 and 60, respectively. 

cosa.pc <- pc.estK(Kobs = gyps.env$obs[gyps.env$r<=60],
		           r = gyps.env$r[gyps.env$r<=60])

## Add fitted Kclust function to the plot.

lines(gyps.env$r,sqrt(Kclust(gyps.env$r, cosa.pc$sigma2,cosa.pc$rho)/pi)-gyps.env$r,
       lty=2, lwd=3, col="purple")

## A kind of pointwise test of the gypsophylous pattern been a realisation
## of the fitted model, simulating with sim.poissonc and using function J (Jest).

gyps.env.sim <- envelope(gypsophylous, Jest, nsim=nsim,
                    simulate=expression(sim.poissonc(gypsophylous,
		    sigma=sqrt(cosa.pc$sigma2), rho=cosa.pc$rho)))

plot(gyps.env.sim,  main="",legendpos="bottomleft")





