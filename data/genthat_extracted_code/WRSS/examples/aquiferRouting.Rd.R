library(WRSS)


### Name: aquiferRouting
### Title: base function for aquifer simulation
### Aliases: aquiferRouting
### Keywords: list matrix

### ** Examples

    
    area           <-200
    leakageFraction<-0.01
    Sy             <-0.15
    volume         <-20000
    priority       <-c(3,1,1,2)
    rechargeTS     <-rnorm(120,60,8)
    demand         <-matrix(rnorm(480,10,3),120)
    simulation     <-list(start='2000-01-01',end='2009-12-29',interval='month')
    
    res<-
      aquiferRouting(demand         =demand         ,
                     priority       =priority       ,
                     area           =area           ,
                     volume         =volume       ,
                     rechargeTS     =rechargeTS     ,
                     leakageFraction=leakageFraction,
                     Sy             =Sy             ,
                     simulation     =simulation)
    
    plot(res$storage$storage,ylab='Storage (MCM)',xlab='time steps(month)',type='o')
  


