library(benford.analysis)


### Name: getData
### Title: Gets the data used of a Benford object
### Aliases: getData

### ** Examples

data(corporate.payment) 
cp <- benford(corporate.payment$Amount) #generates benford object
getData(cp) # equivalent to cp$data



