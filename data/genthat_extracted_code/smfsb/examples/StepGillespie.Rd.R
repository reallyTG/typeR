library(smfsb)


### Name: StepGillespie
### Title: Create a function for advancing the state of an SPN by using the
###   Gillespie algorithm
### Aliases: StepGillespie
### Keywords: smfsb

### ** Examples

# load up the Lotka-Volterra (LV) model
data(spnModels)
LV
# create a stepping function
stepLV = StepGillespie(LV)
# step the function
print(stepLV(c(x1=50,x2=100),0,1))
# simulate a realisation of the process and plot it
out = simTs(c(x1=50,x2=100),0,100,0.1,stepLV)
plot(out)
plot(out,plot.type="single",lty=1:2)
# simulate a realisation using simTimes
times = seq(0,100,by=0.1)
plot(ts(simTimes(c(x1=50,x2=100),0,times,stepLV),start=0,deltat=0.1),plot.type="single",lty=1:2)
# simulate a realisation at irregular times
times = c(0,10,20,50,100)
out2 = simTimes(c(x1=50,x2=100),0,times,stepLV)
print(out2)



