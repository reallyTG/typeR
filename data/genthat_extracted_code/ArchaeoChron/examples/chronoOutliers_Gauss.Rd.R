library(ArchaeoChron)


### Name: chronoOutliers_Gauss
### Title: Bayesian chronologies of Gaussian dates using the outlier
###   modelling of Oxcal software
### Aliases: chronoOutliers_Gauss
### Keywords: Chronology Oxcal Gaussian dates

### ** Examples

  ### simulated data (see examples(chronoEvent_Gauss))
  
  # Number of event 
  Nevt  = 3 
  # number of dates by events  
  measurementsPerEvent = c(2,3,2)
  # positions 
  pos = 1 + c(0, cumsum(measurementsPerEvent) ) 
  
  # simulation of data    
  theta.evt = seq(1,10, length.out= Nevt)
  theta.evt[3] <- theta.evt[3] - 3 # stratigraphic inversion 

  theta = NULL 
  for(i in 1:Nevt ){
    theta = c(theta, rep(theta.evt[i],measurementsPerEvent[i])) 
    } 
    
  s = seq(1,1, length.out= sum(measurementsPerEvent)) 
  
  M=NULL 
  for( i in 1:sum(measurementsPerEvent)){
    M= c(M, rnorm(1, theta[i], s[i] ))
    }  
  
  MCMCSample = chronoOutliers_Gauss(M, s, outliersIndivVariance = rep(5,7), 
  outliersBernouilliProba=rep(0.2,7), studyPeriodMin=-10, studyPeriodMax=30, 
  numberAdapt = 1000, numberUpdate = 1000, numberSample = 5000)
  plot(MCMCSample)



