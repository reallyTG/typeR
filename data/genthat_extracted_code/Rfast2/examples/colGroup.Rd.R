library(Rfast2)


### Name:  Column-wise summary statistics with grouping variables 
### Title: Column-wise summary statistics with grouping variables
### Aliases: colGroup
### Keywords: Column wise of grouping variables

### ** Examples


x <- matrix(runif(100 * 5), 100, 5)
group <- sample(1:3, 100, TRUE)

all.equal( colGroup(x, group), rowsum(x, group) )




