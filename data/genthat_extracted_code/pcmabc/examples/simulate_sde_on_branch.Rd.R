library(pcmabc)


### Name: simulate_sde_on_branch
### Title: Simulate a stochastic differential equation on a branch. using
###   the 'yuima'
### Aliases: simulate_sde_on_branch
### Keywords: datagen

### ** Examples

## simulate a 3D OUBM process on a branch
set.seed(12345)

A <-c("-(x1-1)-2*x3","-(x2+1)+2*x3",0)
S <- matrix( c( 1, 2, 0, 0, 1 , 0, 0, 0, 
2), 3, 3,byrow=TRUE)
yuima.3d <- yuima::setModel(drift = A, diffusion = S,
state.variable=c("x1","x2","x3"),solve.variable=c("x1","x2","x3") )
X0<-c(0,0,0)
step<-0.5 ## for keeping example's running time short <5s as CRAN policy, 
          ## in reality should be much smaller e.g. step<-0.001          
            
time<-1
simulate_sde_on_branch(time,yuima.3d,X0,step)



