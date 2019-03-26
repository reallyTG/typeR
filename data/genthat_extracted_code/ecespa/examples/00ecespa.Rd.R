library(ecespa)


### Name: ecespa
### Title: Functions for spatial point pattern analysis in ecology
### Aliases: ecespa-package ecespa
### Keywords: package spatial

### ** Examples

## Not run: 
##D 
##D #############################################
##D ### Transfom easily data from a data.frame into the ppp format 
##D ### of spatstat:
##D 
##D data(fig1)
##D 
##D plot(fig1) #typical xyplot
##D 
##D fig1.ppp <- haz.ppp (fig1)
##D 
##D fig1.ppp
##D 
##D plot(fig1.ppp) # point pattern plot of spatstat
##D 
##D 
##D 
##D #############################################
##D ###  Summarize the joint pattern of points and marks at different scales
##D ###  with the normalized mark-weighted K-function (Penttinen, 2006). 
##D ###  Compare this function in two consecutive cohorts of Helianthemum
##D ###  squamatum seedlings:
##D 
##D  ## Figure 3.10 of De la Cruz (2008):
##D   
##D   data(seedlings1)
##D   
##D   data(seedlings2)
##D   
##D   s1km <- Kmm(seedlings1, r=1:100)
##D   
##D   s2km <- Kmm(seedlings2, r=1:100)
##D   
##D   plot(s1km, ylime=c(0.6,1.2), lwd=2, maine="", xlabe="r(cm)")
##D 
##D   plot(s2km,  lwd=2, lty=2, add=T )
##D 
##D   abline(h=1, lwd=2, lty=3)
##D   
##D   legend(x=60, y=1.2, legend=c("Hs_C1", "Hs_C2", "H0"),
##D 	 lty=c(1, 2, 3), lwd=c(3, 2, 2), bty="n")
##D  
##D ## A pointwise test of normalized Kmm == 1 for seedlings1:
##D 
##D    s1km.test <- Kmm(seedlings1, r=1:100, nsim=99)
##D 
##D    plot(s1km.test,  xlabe="r(cm)")
##D    
##D    
##D    
##D 
##D #############################################
##D ###  Explore the local relationships between marks and locations (e.g. size 
##D ###  of one cohort of H. squamatum seedlings). Map the marked point pattern 
##D ###  to a random field for visual inspection, with the normalized mark-sum
##D ###  measure (Penttinen, 2006).
##D 
##D data(seedlings1)
##D    
##D  seed.m <- marksum(seedlings1, R=25)
##D 
##D  plot(seed.m, what="marksum", sigma = 5)  # raw mark-sum measure; sigma is bandwith for smoothing
##D 
##D  plot(seed.m, what="pointsum", sigma = 5) # point sum measure
##D    
##D  plot(seed.m,  what="normalized", dimyx=200, contour=TRUE, sigma = 5) # normalized  mark-sum measure
##D 
##D # the same with added grid
##D 
##D  plot(seed.m,  what="normalized", dimyx=200, contour=TRUE, sigma = 5, grid=TRUE) 
##D 
##D 
##D 
##D #############################################
##D ###  Test against the null model of "independent labelling",
##D ###  i.e. test asociation/repulsion between  a "fixed" pattern (e.g. adult
##D ###  H. squamatum plants) and a "variable" pattern (e.g. of surviving and 
##D ###  dead seedlings), with 2.5% and 97.5% envelopes of 999 random 
##D ###  labellings (De la Cruz & al. 2008).
##D 
##D data(Helianthemum)
##D 
##D 
##D cosa <- K012(Helianthemum, fijo="adultHS", i="deadpl", j="survpl",
##D              r=seq(0,200,le=201), nsim=999, nrank=25, correction="isotropic")
##D 
##D plot(cosa$k01, sqrt(./pi)-r~r,  col=c(3, 1, 3), lty=c(3, 1, 3), las=1,
##D          ylab=expression(L[12]), xlim=c(0, 200), 
##D 	 main="adult HS vs. dead seedlings", legend=FALSE)
##D 
##D plot(cosa$k02, sqrt(./pi)-r~r, col=c(3, 1, 3), lty=c(3, 1, 3), las=1, 
##D          ylab=expression(L[12]), xlim=c(0, 200),
##D  	 main="adult HS vs. surviving seedlings", legend=FALSE)
##D 
##D 
##D 
##D #############################################
##D ###  Test differences of agregation and segregation between two patterns, 
##D ###  e.g. surviving and dying H. squamatum seedlings (De la Cruz & al. 2008). 
##D 
##D data(Helianthemum)
##D 
##D cosa12 <- K1K2(Helianthemum, j="deadpl", i="survpl", r=seq(0,200,le=201),
##D 		 nsim=999, nrank=1, correction="isotropic")
##D 
##D plot(cosa12$k1k2, lty=c(2, 1, 2), col=c(2, 1, 2), xlim=c(0, 200),
##D          main= "survival- death",ylab=expression(K[1]-K[2]), legend=FALSE)
##D 
##D plot(cosa12$k1k12, lty=c(2, 1, 2), col=c(2, 1, 2), xlim=c(0, 200),
##D 	 main="segregation of surviving seedlings",ylab=expression(K[1]-K[12]), legend=FALSE)
##D 
##D plot(cosa12$k2k12, lty=c(2, 1, 2), col=c(2, 1, 2), xlim=c(0, 200),
##D          main= "segregation of dying seedlings",ylab=expression(K[2]-K[12]), legend=FALSE)
##D 
##D 
##D #############################################
##D ###  Test 'univariate' and 'bivariate' point patterns 
##D ###  against non-Poisson (in-)homogeneous models 
##D ###  (De la Cruz and Escudero, submited).
##D 
##D  data(urkiola)
##D 
##D    #####################
##D    ## univariate example
##D 
##D    # get univariate pp
##D    I.ppp <- split.ppp(urkiola)$birch
##D 
##D    # estimate inhomogeneous intensity function
##D    I.lam <- predict (ppm(I.ppp, ~polynom(x,y,2)), type="trend", ngrid=200)
##D 
##D    # Compute and plot envelopes to Kinhom, simulating from an Inhomogeneous
##D    #  Poisson Process:
##D    
##D    I2.env <- envelope( I.ppp,Kinhom, lambda=I.lam, correction="trans", 
##D                               nsim=99, simulate=expression(rpoispp(I.lam)))
##D    plot(I2.env, sqrt(./pi)-r~r, xlab="r (metres)", ylab= "L (r)", col=c(1,3,2,2),legend=FALSE) 
##D 
##D    # It seems that there is short scale clustering; let's fit an Inhomogeneous 
##D    # Poisson Cluster Process: 
##D 
##D    I.ki <- ipc.estK(mippp=I.ppp, lambda=I.lam, correction="trans")
##D 
##D    # Compute and plot envelopes to Kinhom, simulating from the fitted IPCP:
##D 
##D    Ipc.env <- Ki(I.ki, correction="trans", nsim=99, ngrid=200)
##D 
##D    plot (Ipc.env, xlab="r (metres)", ylab= "L (r)")
##D  
##D    #####################
##D    ## bivariate example: test independence between birch and quercus in Urkiola
##D 
##D    J.ppp <- split.ppp(urkiola)$oak
##D    
##D    # We want to simulate oak from a homogeneous Poisson model:
##D    J.ppm <- ppm(J.ppp, trend=~1, interaction=Poisson() )
##D    
##D    IJ.env <- Kci (mod1=I.ki, mod2=J.ppm, nsim=99)
##D    
##D    plot(IJ.env, type=12)
##D    
##D    plot(IJ.env, type=21)
##D 
##D 
##D 
##D 
##D #############################################
##D ###  Simulate envelopes from the fitted values of a logistic model,
##D ###  as in Olano et al. (2009)
##D    
##D    
##D    data(quercusvm)
##D 
##D    # read fitted values from logistic model:
##D    
##D    
##D    probquercus <-c(0.99955463, 0.96563477, 0.97577094, 0.97327199, 0.92437309,
##D    0.84023396, 0.94926682, 0.89687281, 0.99377915, 0.74157478, 0.95491518,
##D    0.72366493, 0.66771787, 0.77330148, 0.67569082, 0.9874892, 0.7918891, 
##D    0.73246803, 0.81614635, 0.66446411, 0.80077908, 0.98290508, 0.54641754,
##D    0.53546689, 0.73273626, 0.7347013, 0.65559655, 0.89481468, 0.63946334,
##D    0.62101995, 0.78996371, 0.93179582, 0.80160346, 0.82204428, 0.90050059,
##D    0.83810669, 0.92153079, 0.47872421, 0.24697004, 0.50680935, 0.6297911, 
##D    0.46374812, 0.65672284, 0.87951682, 0.35818237, 0.50932432, 0.92293014,
##D    0.48580241, 0.49692053, 0.52290553, 0.7317549, 0.32445982, 0.30300865,
##D    0.73599359, 0.6206056, 0.85777043, 0.65758613, 0.50100406, 0.31340849, 
##D    0.22289286, 0.40002879, 0.29567678, 0.56917817, 0.56866864, 0.27718552,
##D    0.4910667, 0.47394411, 0.40543788, 0.29571349, 0.30436276, 0.47859015,
##D    0.31754526, 0.42131675, 0.37468782, 0.73271225, 0.26786274, 0.59506388, 
##D    0.54801851, 0.38983575, 0.64896835, 0.37282031, 0.67624306, 0.29429766,
##D    0.29197755, 0.2247629, 0.40697843, 0.17022391, 0.26528042, 0.24373722,
##D    0.26936163, 0.13052254, 0.19958585, 0.18659692, 0.36686678, 0.47263005,
##D    0.39557661, 0.68048997, 0.74878567, 0.88352322, 0.93851375)
##D    
##D   
##D 
##D    ################################ 
##D    ## Envelopes for an homogeneous point pattern:
##D    
##D    cosap <- Kinhom.log(A=quercusvm, lifemark="0", nsim=99, prob=probquercus)
##D 
##D    plot(cosap)
##D 
##D    
##D    ################################ 
##D    ## Envelopes for an inhomogeneous point pattern:
##D    
##D    ## First, fit an inhomogeneous Poisson model to alive trees :
##D    
##D    quercusalive <- unmark(quercusvm[quercusvm$marks == 0])
##D 
##D     mod2 <- ppm(quercusalive, ~polynom(x,y,2))
##D 
##D     ## Now use mod2 to estimate lambda for K.inhom:
##D     
##D     cosapm <- Kinhom.log(A=quercusvm, lifemark="0", prob=probquercus,
##D                                    nsim=99,  mod=mod2)
##D     plot(cosapm)
##D 
##D 
##D 
##D 
##D #############################################
##D ###  Test segregation based on the counts in the contingency table
##D ###  of nearest neighbors in a multitype point pattern (Dixon, 2002)
##D 
##D data(swamp)
##D 
##D dixon2002(swamp,nsim=99)
##D 
##D 
##D 
##D 
##D #############################################
##D ###  Fit the Poisson cluster point process to a point pattern with 
##D ###  the method of minimum contrast (Diggle 2003).
##D 
##D data(gypsophylous)
##D 
##D # Estimate K function ("Kobs").
##D 
##D gyps.env <- envelope(gypsophylous, Kest, correction="iso", nsim=99)
##D 
##D plot(gyps.env, sqrt(./pi)-r~r, ylab="L(r)", legend=FALSE)
##D 
##D # Fit Poisson Cluster Process. The limits of integration 
##D # rmin and rmax are setup to 0 and 60, respectively. 
##D 
##D cosa.pc <- pc.estK(Kobs = gyps.env$obs[gyps.env$r<=60],
##D 		           r = gyps.env$r[gyps.env$r<=60])
##D 
##D # Add fitted Kclust function to the plot.
##D 
##D lines(gyps.env$r,sqrt(Kclust(gyps.env$r, cosa.pc$sigma2,cosa.pc$rho)/pi)-gyps.env$r,
##D        lty=2, lwd=3, col="purple")
##D 
##D # A kind of pointwise test of the gypsophylous pattern been a realisation
##D # of the fitted model, simulating with sim.poissonc and using function J (Jest).
##D 
##D gyps.env.sim <- envelope(gypsophylous, Jest, nsim=99,
##D                     simulate=expression(sim.poissonc(gypsophylous,
##D 		    sigma=sqrt(cosa.pc$sigma2), rho=cosa.pc$rho)))
##D 
##D  plot(gyps.env.sim,  main="",legendpos="bottomleft")
##D 
##D 
##D 
##D 
##D 
##D 
##D #############################################
##D ###  Compute Syrjala's test for the difference between the spatial 
##D ###  distributions of two populations, as in Rey-Benayas et al. 
##D ### (submited)
##D 
##D 
##D  
##D    data(syr1); data(syr2); data(syr3)
##D    
##D    plot(syrjala.test(syr1, syr2, nsim=999)) 
##D    
##D    plot(syrjala.test(syr1, syr3, nsim=999)) 
##D    
##D 
##D 
##D 
## End(Not run)



