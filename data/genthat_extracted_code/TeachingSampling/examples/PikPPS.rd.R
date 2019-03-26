library(TeachingSampling)


### Name: PikPPS
### Title: Inclusion Probabilities in Proportional to Size Sampling Designs
### Aliases: PikPPS
### Keywords: survey

### ** Examples

############
## Example 1
############
x <- c(30,41,50,170,43,200)
n <- 3
# Two elements yields values bigger than one
n*x/sum(x)
# With this functions, all of the values are between zero and one
PikPPS(n,x)
# The sum is equal to the sample size
sum(PikPPS(n,x))

############
## Example 2
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# The auxiliary information
x <- c(52, 60, 75, 100, 50)
# Gives the inclusion probabilities for the population accordin to a 
# proportional to size design without replacement of size n=4
pik <- PikPPS(4,x)
pik
# The selected sample is
sum(pik)

############
## Example 3
############
# Uses the Lucy data to compute teh vector of inclusion probabilities 
# accordind to a piPS without replacement design
data(Lucy)
attach(Lucy)
# The sample size
n=400
# The selection probability of each unit is proportional to the variable Income
pik <- PikPPS(n,Income)
# The inclusion probabilities of the units in the sample
pik
# The sum of the values in pik is equal to the sample size
sum(pik)
# According to the design some elements must be selected
# They are called forced inclusion units
which(pik==1)



