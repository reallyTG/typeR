library(ecespa)


### Name: Kci
### Title: Test against non-Poisson (in-)homogeneous models
### Aliases: Kci Ki plot.ecespa.kci print.ecespa.kci ecespa.kci
### Keywords: spatial

### ** Examples

  
    
    data(urkiola)
    
    # set the number of simulations (nsim=199 or larger for real analyses)
    nsim<- 5

  #####################
   ## univariate case

   # get univariate pp
   I.ppp <- split.ppp(urkiola)$birch

   # estimate inhomogeneous intensity function
   I.lam <- predict (ppm(I.ppp, ~polynom(x,y,2)), type="trend", ngrid=200)

   # Compute and plot envelopes to Kinhom, simulating from an Inhomogeneous
   #  Poisson Process:
   
   I2.env <- envelope( I.ppp,Kinhom, lambda=I.lam, correction="trans", 
                              nsim=nsim, simulate=expression(rpoispp(I.lam)))
   plot(I2.env, sqrt(./pi)-r~r, xlab="r (metres)", ylab= "L (r)", col=c(1,3,2,2),legend=FALSE) 

   # It seems that there is short scale clustering; let's fit an Inhomogeneous 
   # Poisson Cluster Process: 

   I.ki <- ipc.estK(mippp=I.ppp, lambda=I.lam, correction="trans")

   # Compute and plot envelopes to Kinhom, simulating from the fitted IPCP:

   Ipc.env <- Ki(I.ki, correction="trans", nsim=nsim, ngrid=200)

   plot (Ipc.env, xlab="r (metres)", ylab= "L (r)")
 
  ## Not run: 
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
##D  
## End(Not run)




