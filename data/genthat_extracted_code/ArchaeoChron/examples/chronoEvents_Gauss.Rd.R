library(ArchaeoChron)


### Name: chronoEvents_Gauss
### Title: Bayesian chronologies of Gaussian dates using the Event Model
### Aliases: chronoEvents_Gauss
### Keywords: Chronology Event Model Gaussian dates

### ** Examples

  ### simulated data 
  
  # Number of events 
  Nevt  = 3 
  # number of dates by events  
  measurementsPerEvent = c(2,3,2)
  # positions 
  pos = 1 + c(0, cumsum(measurementsPerEvent) ) 
  
  # simulation of data    
  theta.evt = seq(1,10, length.out= Nevt)
  theta.evt[3] <-theta.evt[3] - 3 # stratigraphic inversion 

  theta = NULL 
  for(i in 1:Nevt ){
    theta = c(theta, rep(theta.evt[i],measurementsPerEvent[i])) 
    } 
    
  s = seq(1,1, length.out= sum(measurementsPerEvent)) 
  
  M=NULL 
  for( i in 1:sum(measurementsPerEvent)){
    M= c(M, rnorm(1, theta[i], s[i] ))
    }  
  
  sO2 = 1:Nevt 
  for (i in  1:Nevt) {
  sO2[i]= 1/mean( 1/(s[pos[i]:(pos[i+1] -1)])^2 ) 
  }
  
  MCMCSample = chronoEvents_Gauss( M=M, s=s, measurementsPerEvent=measurementsPerEvent, 
  studyPeriodMin=-10, studyPeriodMax=30)
  plot(MCMCSample)



