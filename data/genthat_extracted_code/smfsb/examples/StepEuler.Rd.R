library(smfsb)


### Name: StepEuler
### Title: Create a function for advancing the state of an ODE model by
###   using a simple Euler integration method
### Aliases: StepEuler
### Keywords: smfsb

### ** Examples

# Build a RHS for the Lotka-Volterra system
LVrhs <- function(x,t,th=c(c1=1,c2=0.005,c3=0.6))
{
        with(as.list(c(x,th)),{
                c( c1*x1 - c2*x1*x2 ,
                      c2*x1*x2 - c3*x2 )
        })
}
# create a stepping function
stepLV = StepEuler(LVrhs)
# step the function
print(stepLV(c(x1=50,x2=100),0,1))
# integrate the process and plot it
out = simTs(c(x1=50,x2=100),0,20,0.1,stepLV)
plot(out,plot.type="single",lty=1:2)



