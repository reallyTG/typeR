library(BenfordTests)


### Name: signifd
### Title: First Digits Function
### Aliases: signifd
### Keywords: manip

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)
#Create a sample satisfying Benford's law
X<-rbenf(n=20)
#Look at the first digits of the sample
signifd(X)
#should be:
#[1] 6 1 5 2 7 5 7 4 3 1 2 2 1 5 6 2 2 3 1 3



