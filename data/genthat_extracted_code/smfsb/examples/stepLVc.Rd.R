library(smfsb)


### Name: stepLVc
### Title: A function for advancing the state of a Lotka-Volterra model by
###   using the Gillespie algorithm
### Aliases: stepLVc
### Keywords: smfsb

### ** Examples

# load the LV model
data(spnModels)
# create a stepping function
stepLV = StepGillespie(LV)
# step the function
print(stepLV(c(x1=50,x2=100),0,1))
# simulate a realisation of the process and plot it
out = simTs(c(x1=50,x2=100),0,100,0.1,stepLV)
plot(out)
# now use "stepLVc" instead...
out = simTs(c(x1=50,x2=100),0,100,0.1,stepLVc)
plot(out)



