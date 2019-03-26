library(NCmisc)


### Name: estimate.memory
### Title: Estimate the memory required for an object.
### Aliases: estimate.memory

### ** Examples

myMatrix <- matrix(rnorm(100),nrow=10)
myVec <- sample(1:1000)
estimate.memory(myMatrix,unit="bytes") # enter a matrix object
estimate.memory(myVec,unit="kb" ,add.unit=TRUE) # enter a vector object
estimate.memory(c(10,10,10,10,10),unit="kb") # 5 dimensional array
estimate.memory(c(10^6,10^4), add.unit=TRUE) # large matrix
estimate.memory(5.4*10^8, add.unit=TRUE)  # entering argument as # total cells, rather than dims
estimate.memory(5.4*10^8, integer=TRUE, add.unit=TRUE)
estimate.memory(5.4*10^8, raw=TRUE, add.unit=TRUE)
estimate.memory(5.4*10^8, TRUE, TRUE, add.unit=TRUE) #  'integer' overrides 'raw'



