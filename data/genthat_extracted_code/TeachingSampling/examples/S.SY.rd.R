library(TeachingSampling)


### Name: S.SY
### Title: Systematic Sampling
### Aliases: S.SY
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The population of size N=5 is divided in a=2 groups
# Draws a Systematic sample. 
sam <- S.SY(5,2)
sam
# The selected sample is
U[sam]
# There are only two possible samples

############
## Example 2
############
# Uses the Lucy data to draw a Systematic sample
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
# The population is divided in 6 groups
# The selected sample
sam <- S.SY(N,6)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
data
dim(data)



