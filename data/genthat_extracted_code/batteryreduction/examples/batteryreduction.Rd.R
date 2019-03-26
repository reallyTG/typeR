library(batteryreduction)


### Name: batteryreduction
### Title: A function for data reduction
### Aliases: batteryreduction

### ** Examples

## Generate an example dataset
set.seed(1234)
data<-data.frame(x1=rnorm(n=100, mean=14, sd=7),
x2=rnorm(n=100, mean=3, sd=1),
x3=rpois(n=100, lambda=1),
x4=rpois(n=100, lambda=10),
x5=rgamma(n=100, shape=1),
x6=rgamma(n=100, shape=10))
## Demonstrate batteryreduction
vars<-c('x1','x2','x3','x4','x5','x6')
numfact<-3
batteryreduction(vars, numfact, data)



