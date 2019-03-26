library(SOMbrero)


### Name: protoDist
### Title: Compute distances between prototypes
### Aliases: protoDist.somRes protoDist
### Keywords: methods

### ** Examples

set.seed(2343)
my.som <- trainSOM(x.data=iris[,1:4], dimension=c(5,5))
protoDist(my.som)



