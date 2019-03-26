library(ArchaeoChron)


### Name: chrono_Gauss
### Title: Bayesian chronologies of Gaussian dates
### Aliases: chrono_Gauss
### Keywords: Chronology Chronology of dates Gaussian dates

### ** Examples

  ### simulated data (see examples(chronoEvent_Gauss))
  
  # Number of events 
  Nevt  = 3 
  # number of dates by events  
  measurementsPerEvent = c(2,3,2)
  # positions 
  pos = 1 + c(0, cumsum(measurementsPerEvent) ) 
  
  # simulation of data    
  theta.evt = seq(1,10, length.out= Nevt)

  theta = NULL 
  for(i in 1:Nevt ){
    theta = c(theta, rep(theta.evt[i],measurementsPerEvent[i])) 
    } 
    
  s = seq(1,1, length.out= sum(measurementsPerEvent)) 
  
  M=NULL 
  for( i in 1:sum(measurementsPerEvent)){
    M= c(M, rnorm(1, theta[i], s[i] ))
    }  
  
  MCMCSample = chrono_Gauss(M, s, studyPeriodMin=-10, studyPeriodMax=30)
  plot(MCMCSample)



