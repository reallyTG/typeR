library(WRSS)


### Name: diversionRouting
### Title: base function for diversion simulation
### Aliases: diversionRouting
### Keywords: list matrix

### ** Examples

  demand         <-matrix(rnorm(480,10,3),120)
  priority       <-sample(1:3,4,replace=TRUE)
  capacity       <-12
  inflow         <-rlnorm(120,log(50),log(4))
  simulation     <-list(start='2000-01-01',end='2009-12-29',interval='month')
  res<-diversionRouting(demand=demand,
                        priority=priority,
                        capacity=capacity,
                        inflow=inflow,
                        simulation=simulation)
  plot(ecdf(res$diverted$diverted),xlab='cms',ylab='exceedance probability')



