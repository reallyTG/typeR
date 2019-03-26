library(asd)


### Name: gtreatsel.sim
### Title: ASD simulation for treatment selection
### Aliases: gtreatsel.sim
### Keywords: design

### ** Examples


gtreatsel.sim(z1=c(1,0,2),z2=c(1,0,2),zearly=c(1,0,1), 
    v1=c(1,1,1,1),v2=c(1,1,1,1),vearly=c(1,1,1,1), 
    corr=0,weight=0.25,nsim=100,seed=12345678,
    select=1,level=0.025,ptest = c(1:3),method="fisher")




