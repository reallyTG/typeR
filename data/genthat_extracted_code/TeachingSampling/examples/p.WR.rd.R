library(TeachingSampling)


### Name: p.WR
### Title: Generalization of every with replacement sampling design
### Aliases: p.WR
### Keywords: survey

### ** Examples

############
## Example 1
############
# With replacement simple random sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector pk is the sel?ection probability of the units in the finite population
pk <- c(0.2, 0.2, 0.2, 0.2, 0.2)
sum(pk)
N <- length(pk)
m <- 3
# The smapling design
p <- p.WR(N, m, pk)
p
sum(p)

############
## Example 2
############
# With replacement PPS random sampling
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector x is the auxiliary information and y is the variables of interest
x<-c(32, 34, 46, 89, 35)
y<-c(52, 60, 75, 100, 50)
# Vector pk is the sel?ection probability of the units in the finite population
pk <- x/sum(x)
sum(pk)
N <- length(pk)
m <- 3
# The smapling design
p <- p.WR(N, m, pk)
p
sum(p)



