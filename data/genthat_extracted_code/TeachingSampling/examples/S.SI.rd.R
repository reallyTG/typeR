library(TeachingSampling)


### Name: S.SI
### Title: Simple Random Sampling Without Replacement
### Aliases: S.SI
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Fixes the random numbers in order to select a sample
# Ideal for teaching purposes in the blackboard
e <- c(0.4938, 0.7044, 0.4585, 0.6747, 0.0640)
# Draws a simple random sample without replacement of size n=3
sam <- S.SI(5,3,e)
sam
# The selected sample is
U[sam]

############
## Example 2
############
# Uses the Marco and Lucy data to draw a random sample according to a SI design
data(Marco)
data(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam<-S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



