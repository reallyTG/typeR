library(RandomFields)


### Name: RMstp
### Title: Single temporal process
### Aliases: RMstp RMstp
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMstp(xi = RMrotat(phi= -2 * pi, speed=1),
               phi = RMwhittle(nu = 1),
               M=matrix(nc=3, rep(0, 9)),
               S=RMetaxxa(E=rep(1, 3), alpha = -2 * pi,
                          A=t(matrix(nc=3, c(2, 0, 0, 1, 1 , 0, 0, 0, 0))))
              )
x <- seq(0, 10, 0.7)
plot(RFsimulate(model, x=x, y=x, z=x))
## Don't show: 
FinalizeExample()
## End(Don't show)


