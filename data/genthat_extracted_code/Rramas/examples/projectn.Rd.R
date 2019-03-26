library(Rramas)


### Name: projectn
### Title: Demographic Projections
### Aliases: projectn project1 estambi estdemo plot.rmas plot.summary.rmas
###   summary.rmas
### Keywords: algebra models

### ** Examples

   
     data(coryphanthaA)
     coryphanthaA <- as.tmatrix(coryphanthaA)
  
     # run a deterministic simulation of 20 years from an initial state of
     # 100 small juveniles:
     v0 <- c(100,0,0)
     simu20 <- projectn(v0=v0, mat=coryphanthaA, time = 20)
     plot(simu20, sum=FALSE)
     summary(simu20)
  
     # run 100 simulations of 20 years with  demographic stochasticity:
     simu20.ds <- projectn(v0=v0, mat=coryphanthaA, time = 20, estdem=TRUE, nrep=100)
     plot(simu20.ds)
     summary(simu20.ds)
     
     # run 100 simulations of 20 years with  demographic stochasticity but 
     # assuming that the first row of the transition matrix represent both
     # fecundity and survival, each with a 50% contribution 
     
     # first generate the stmat matrix:
     stmat <- (coryphanthaA >0)
     stmat <- stmat*c(0.5,0,0)
     stmat
     
     simu20.ds2 <- projectn(v0=v0, mat=coryphanthaA, time = 20, estdem=TRUE,
                             stmat=stmat, nrep=100)
     plot(simu20.ds2)
     summary(simu20.ds2)
          
  
     # run 100 simulations of 20 years with  both demographic and environmental
     # stochasticity:
     # first generate a sd matrix to describe environmental stochasticity:
     sdenv <- coryphanthaA/20 
     sdenv
     
     simu20.eds <- projectn(v0=v0, mat=coryphanthaA, matsd =sdenv,  time = 20,
                            estdem=TRUE,estamb=TRUE, nrep=100)
     plot(simu20.eds)
     summary(simu20.eds)
     
     # Example of management actions
     #    each time step, 10 individuals will be added to the first stage ,10 individuals  
     #    will be added to the second stage, and 50 percent of the individuals in the 
     #    third stage will be extracted
     
        man <- c(10, 10, -0.5)
        p1 <- projectn(v0 = c(100, 100,100), mat= coryphanthaA, management=man)
	
        # summarize and plot population trajectory
        summary(p1) 
	
	# summarizes and plots harvest history
	summary(p1, harvest=TRUE)  
           




