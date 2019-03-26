library(qtl)


### Name: comparegeno
### Title: Compare individuals' genotype data
### Aliases: comparegeno
### Keywords: utilities

### ** Examples

data(listeria)

output <- comparegeno(listeria)

# image of the proportions
n.ind <- nind(listeria)
image(1:n.ind, 1:n.ind, output, col=gray((0:99)/99),
      breaks=seq(0,1,len=101))

# histogram 
hist(output, breaks=150, prob=TRUE,
     xlab="Proportion of matching genotypes")
rug(output)



