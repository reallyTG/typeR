library(smfsb)


### Name: simTs
### Title: Simulate a model on a regular grid of times, using a function
###   (closure) for advancing the state of the model
### Aliases: simTs
### Keywords: smfsb

### ** Examples

# load the LV model
data(spnModels)
# create a stepping function
stepLV = StepGillespie(LV)
# simulate a realisation of the process and plot it
out = simTs(c(x1=50,x2=100),0,100,0.1,stepLV)
plot(out)
plot(out,plot.type="single",lty=1:2)



