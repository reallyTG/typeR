library(ecespa)


### Name: ipc.estK
### Title: Fit the (In)homogeneous Poisson Cluster Point Process by Minimum
###   Contrast
### Aliases: ipc.estK plot.ecespa.minconfit print.ecespa.minconfit
###   ecespa.minconfit
### Keywords: spatial

### ** Examples



#####################
## Same example as in pc.estK

data(gypsophylous)

# set the number of simulations (nsim=199 or larger for real analyses)
# and resolution for lambda (ngrid=200  or larger for real analyses)
nsim<- 19
ngrid <- 50

## Estimate K function ("Kobs").

gyps.env <- envelope(gypsophylous, Kest, correction="iso", nsim=nsim)

plot(gyps.env, sqrt(./pi)-r~r, legend=FALSE)

## Fit Poisson Cluster Process. The limits of integration 
## rmin and rmax are setup to 0 and 60, respectively. 

cosa.pc2 <- ipc.estK(gypsophylous, r = gyps.env$r[gyps.env$r<=60])

## Add fitted Kclust function to the plot.


plot(cosa.pc2, add=TRUE, lwd=c(3,3))


## A kind of pointwise test of the gypsophylous pattern been a realisation
## of the fitted model, simulating with rIPCP and using function J (Jest).


gyps.env.sim2 <- envelope(gypsophylous, Jest, nsim=nsim,
                    simulate=expression(rIPCP(cosa.pc2)))


plot(gyps.env.sim2,  main="",legendpos="bottomleft")

## Not run: 
##D 
##D #####################
##D ## Inhomogeneous example
##D 
##D data(urkiola)
##D    
##D    #####################
##D    ## univariate case
##D 
##D    # get univariate pp
##D    I.ppp <- split.ppp(urkiola)$birch
##D 
##D    # estimate inhomogeneous intensity function
##D    I.lam <- predict (ppm(I.ppp, ~polynom(x,y,2)), type="trend", ngrid=ngrid)
##D 
##D    # Compute and plot envelopes to Kinhom, simulating from an Inhomogeneous
##D    #  Poisson Process:
##D    
##D    I2.env <- envelope( I.ppp,Kinhom, lambda=I.lam, correction="trans", 
##D                               nsim=nsim, simulate=expression(rpoispp(I.lam)))
##D    plot(I2.env, sqrt(./pi)-r~r, xlab="r (metres)", ylab= "L (r)", col=c(1,3,2,2),legend=FALSE) 
##D 
##D    # It seems that there is short scale clustering; let's fit an Inhomogeneous 
##D    # Poisson Cluster Process: 
##D 
##D    I.ki <- ipc.estK(mippp=I.ppp, lambda=I.lam, correction="trans")
##D 
##D    # Compute and plot envelopes to Kinhom, simulating from the fitted IPCP:
##D 
##D    Ipc.env <- Ki(I.ki, correction="trans", nsim=nsim, ngrid=ngrid)
##D 
##D    plot (Ipc.env, xlab="r (metres)", ylab= "L (r)")
##D  
##D    #####################
##D    ## bivariate case: test independence between birch and quercus in Urkiola
##D 
##D    J.ppp <- split.ppp(urkiola)$oak
##D    
##D    # We want to simulate oak from a homogeneous Poisson model:
##D    J.ppm <- ppm(J.ppp, trend=~1, interaction=Poisson() )
##D    
##D    IJ.env <- Kci (mod1=I.ki, mod2=J.ppm, nsim=nsim)
##D    
##D    plot(IJ.env, type=12)
##D    
##D    plot(IJ.env, type=21)
## End(Not run)





