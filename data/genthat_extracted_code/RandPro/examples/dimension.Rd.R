library(RandPro)


### Name: dimension
### Title: Function to determine the required number of dimension for
###   generating the projection matrix
### Aliases: dimension
### Keywords: , - Dimension Johnson Lemma, Lindenstrauss Random Reduction
###   projection

### ** Examples

#load library
library(RandPro)

#Calculate minimum dimension using eps =0.5 for 1000000 sample
y <- dimension(1000000,0.5)

#Calculating minimum dimension using different epsilon value for 1000000 sample
d <-  c(0.5,0.1)
x<- dimension(103260,d)




