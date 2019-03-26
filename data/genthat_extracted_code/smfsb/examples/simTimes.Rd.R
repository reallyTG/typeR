library(smfsb)


### Name: simTimes
### Title: Simulate a model at a specified set of times, using a function
###   (closure) for advancing the state of the model
### Aliases: simTimes
### Keywords: smfsb

### ** Examples

# load the LV model
data(spnModels)
# create a stepping function
stepLV = StepGillespie(LV)
# simulate a realisation using simTimes
times = seq(0,100,by=0.1)
plot(ts(simTimes(c(x1=50,x2=100),0,times,stepLV),start=0,deltat=0.1),plot.type="single",lty=1:2)
# simulate a realisation at irregular times
times = c(0,10,20,50,100)
out2 = simTimes(c(x1=50,x2=100),0,times,stepLV)
print(out2)



