library(ecespa)


### Name: rIPCP
### Title: Simulate Inhomogeneous Poisson Cluster Process
### Aliases: rIPCP
### Keywords: spatial

### ** Examples


  
    data(gypsophylous)
  
    plot(gypsophylous) 
    
    ## It 'seems' that the pattern is clustered, so 
    ## fit a Poisson Cluster Process. The limits of integration 
    ## rmin and rmax are setup to 0 and 60, respectively.
    
   cosa.pc2 <- ipc.estK(gypsophylous, r = seq(0, 60, by=0.2))

   ## Create one instance of the fitted PCP:

   pointp <- rIPCP( cosa.pc2)
   
   plot(pointp)
   
   
   
    #####################
    ## Inhomogeneous example

    data(urkiola)

    # get univariate pp
    I.ppp <- split.ppp(urkiola)$birch

    plot(I.ppp)

    #estimate inhomogeneous intensity function
    I.lam <- predict (ppm(I.ppp, ~polynom(x,y,2)), type="trend", ngrid=200)

    # It seems that there is short scale clustering; lets fit an IPCP: 

    I.ki <- ipc.estK(mippp=I.ppp, lambda=I.lam, correction="trans")

    ## Create one instance of the fitted PCP:

    pointpi <- rIPCP( I.ki)
   
    plot(pointpi)
 




