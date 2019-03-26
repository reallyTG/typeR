library(ecespa)


### Name: Kinhom.log
### Title: Simulation envelopes from the fitted values of a logistic model
### Aliases: Kinhom.log
### Keywords: spatial

### ** Examples

  
   
   data(quercusvm)
   
   # set the number of simulations (nsim=199 or larger for real analyses)
   nsim<- 19

   # read fitted values from logistic model:
   
   
   probquercus <-c(0.99955463, 0.96563477, 0.97577094, 0.97327199, 0.92437309,
   0.84023396, 0.94926682, 0.89687281, 0.99377915, 0.74157478, 0.95491518,
   0.72366493, 0.66771787, 0.77330148, 0.67569082, 0.9874892, 0.7918891, 
   0.73246803, 0.81614635, 0.66446411, 0.80077908, 0.98290508, 0.54641754,
   0.53546689, 0.73273626, 0.7347013, 0.65559655, 0.89481468, 0.63946334,
   0.62101995, 0.78996371, 0.93179582, 0.80160346, 0.82204428, 0.90050059,
   0.83810669, 0.92153079, 0.47872421, 0.24697004, 0.50680935, 0.6297911, 
   0.46374812, 0.65672284, 0.87951682, 0.35818237, 0.50932432, 0.92293014,
   0.48580241, 0.49692053, 0.52290553, 0.7317549, 0.32445982, 0.30300865,
   0.73599359, 0.6206056, 0.85777043, 0.65758613, 0.50100406, 0.31340849, 
   0.22289286, 0.40002879, 0.29567678, 0.56917817, 0.56866864, 0.27718552,
   0.4910667, 0.47394411, 0.40543788, 0.29571349, 0.30436276, 0.47859015,
   0.31754526, 0.42131675, 0.37468782, 0.73271225, 0.26786274, 0.59506388, 
   0.54801851, 0.38983575, 0.64896835, 0.37282031, 0.67624306, 0.29429766,
   0.29197755, 0.2247629, 0.40697843, 0.17022391, 0.26528042, 0.24373722,
   0.26936163, 0.13052254, 0.19958585, 0.18659692, 0.36686678, 0.47263005,
   0.39557661, 0.68048997, 0.74878567, 0.88352322, 0.93851375)
   
  

   ################################ 
   ## Envelopes for an homogeneous point pattern:
   
   cosap <- Kinhom.log(A=quercusvm, lifemark="0",  prob=probquercus, nsim=nsim)

   plot(cosap)

   
   ################################ 
   ## Envelopes for an inhomogeneous point pattern:
   
   ## First, fit an inhomogeneous Poisson model to alive trees :
   
   quercusalive <- unmark(quercusvm[quercusvm$marks == 0])

    mod2 <- ppm(quercusalive, ~polynom(x,y,2))

    ## Now use mod2 to estimate lambda for K.inhom:
    
    cosapm <- Kinhom.log(A=quercusvm, lifemark="0", prob=probquercus, 
                                   nsim=nsim, mod=mod2)

   
   ################################ 
   ## An example of homogeneous random thinning:
      
   cosa <- Kinhom.log(A=quercusvm, lifemark="0", nsim=nsim)
   
   plot(cosa)
    
    




