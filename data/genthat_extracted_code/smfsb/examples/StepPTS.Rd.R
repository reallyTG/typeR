library(smfsb)


### Name: StepPTS
### Title: Create a function for advancing the state of an SPN by using a
###   simple approximate Poisson time stepping method
### Aliases: StepPTS
### Keywords: smfsb

### ** Examples

# load up the LV model
data(spnModels)
# create a stepping function
stepLV=StepPTS(LV)
# step the function
print(stepLV(c(x1=50,x2=100),0,1))
# integrate the process and plot it
out = simTs(c(x1=50,x2=100),0,20,0.1,stepLV)
plot(out)
plot(out,plot.type="single",lty=1:2)



