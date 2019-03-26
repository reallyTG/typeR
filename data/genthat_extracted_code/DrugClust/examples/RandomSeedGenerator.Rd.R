library(DrugClust)


### Name: RandomSeedGenerator
### Title: RandomSeedGenerator
### Aliases: RandomSeedGenerator

### ** Examples

r <- 8
c <- 10
m0 <- matrix(0, r, c)
num_clusters=4
features<-apply(m0, c(1,2), function(x) sample(c(0,1),1))
s<-RandomSeedGenerator(4,nrow(features))



