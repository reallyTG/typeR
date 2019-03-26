library(smfsb)


### Name: StepFRM
### Title: Create a function for advancing the state of an SPN by using
###   Gillespie's first reaction method
### Aliases: StepFRM
### Keywords: smfsb

### ** Examples

# load the LV model
data(spnModels)
# create a stepping function
stepLV = StepFRM(LV)
# step the function
print(stepLV(c(x1=50,x2=100),0,1))
# simulate a realisation of the process and plot it
out = simTs(c(x1=50,x2=100),0,100,0.1,stepLV)
plot(out,plot.type="single",lty=1:2)



