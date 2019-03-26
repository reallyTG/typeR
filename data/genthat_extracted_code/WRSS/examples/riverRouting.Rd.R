library(WRSS)


### Name: riverRouting
### Title: base function for rivers and reachs simulation
### Aliases: riverRouting
### Keywords: matrix

### ** Examples

    demand         <-matrix(rnorm(480,15,3),120)
    priority       <-sample(1:3,4,replace=TRUE)
    discharge      <-rlnorm(120,log(50),log(4))
    simulation     <-list(start='2000-01-01',end='2000-04-29',interval='day')
    
    riverRouting(demand    = demand   ,
                 priority  = priority ,
                 discharge = discharge,
                 simulation= simulation)
    
  


