library(hypergeo)


### Name: gosper
### Title: Evaluation of the hypergeometric function using Gosper's method
### Aliases: hypergeo_gosper
### Keywords: math

### ** Examples



hypergeo_gosper(1.1,5.1,3.1,crit())

# Compare MMA: -0.192225 + 0.692328 I

t <- seq(from=0,to=2i*pi,len=100)
plot(exp(t)*(sqrt(8)-exp(t)),asp=1,type='l')
points(crit())





