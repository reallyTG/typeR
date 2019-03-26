library(smfsb)


### Name: StepODE
### Title: Create a function for advancing the state of an ODE model by
###   using the deSolve package
### Aliases: StepODE
### Keywords: smfsb

### ** Examples

# Build a RHS for the Lotka-Volterra system
LVrhs <- function(x,t,parms)
{
        with(as.list(c(x,parms)),{
                c( c1*x1 - c2*x1*x2 ,
                      c2*x1*x2 - c3*x2 )
        })
}
# create a stepping function
stepLV = StepODE(LVrhs)
# step the function
print(stepLV(c(x1=50,x2=100),0,1,parms=c(c1=1,c2=0.005,c3=0.6)))
# integrate the process and plot it
out = simTs(c(x1=50,x2=100),0,50,0.1,stepLV,parms=c(c1=1,c2=0.005,c3=0.6))
plot(out,plot.type="single",lty=1:2)



