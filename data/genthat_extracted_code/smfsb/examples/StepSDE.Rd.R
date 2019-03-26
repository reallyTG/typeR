library(smfsb)


### Name: StepSDE
### Title: Create a function for advancing the state of an SDE model by
###   using a simple Euler-Maruyama integration method
### Aliases: StepSDE
### Keywords: smfsb

### ** Examples

# Immigration-death diffusion approx with death rate a CIR process
myDrift <- function(x,t,th=c(lambda=1,alpha=1,mu=0.1,sigma=0.1))
     {
             with(as.list(c(x,th)),{
                     c( lambda - x*y ,
                           alpha*(mu-y) )
             })
     }
myDiffusion <- function(x,t,th=c(lambda=1,alpha=1,mu=0.1,sigma=0.1))
     {
             with(as.list(c(x,th)),{
                     matrix(c( sqrt(lambda + x*y) , 0,
                           0, sigma*sqrt(y) ),ncol=2,nrow=2,byrow=TRUE)
             })
     }
# create a stepping function
stepProc = StepSDE(myDrift,myDiffusion)
# integrate the process and plot it
out = simTs(c(x=5,y=0.1),0,20,0.1,stepProc)
plot(out)



