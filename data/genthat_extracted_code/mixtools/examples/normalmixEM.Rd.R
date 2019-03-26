library(mixtools)


### Name: normalmixEM
### Title: EM Algorithm for Mixtures of Univariate Normals
### Aliases: normalmixEM
### Keywords: file

### ** Examples

##Analyzing the Old Faithful geyser data with a 2-component mixture of normals.

data(faithful)
attach(faithful)
set.seed(100)
system.time(out<-normalmixEM(waiting, arbvar = FALSE, epsilon = 1e-03))
out
system.time(out2<-normalmixEM(waiting, arbvar = FALSE, epsilon = 1e-03, fast=TRUE))
out2 # same thing but much faster



