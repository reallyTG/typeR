library(benford.analysis)


### Name: dfactor
### Title: Gets the Distortion Factor of a Benford object
### Aliases: dfactor

### ** Examples

data(corporate.payment) #gets data 
cp <- benford(corporate.payment$Amount) #generates benford object
dfactor(cp) # equivalent to cp$distortion.factor



