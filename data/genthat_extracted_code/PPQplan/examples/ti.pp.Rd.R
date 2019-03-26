library(PPQplan)


### Name: ti.pp
### Title: Probability of Passing PPQ Test using Tolerance Interval
### Aliases: ti.pp

### ** Examples

ti.pp(sigma=0.5, mu=2.5, n=10, n.batch=1, Llim=1.5, Ulim=3.5, alpha=0.05)

sapply(X=c(0.1,0.5, 1,2,3,4,5,10), FUN = ti.pp, mu=97, n=10, Llim=95, Ulim=105,
n.batch=1, alpha=0.05)
sapply(X=c(0.1,0.5, 1,2,3,4,5,10), FUN = ti.pp, mu=100, n=10, Llim=95, Ulim=105,
n.batch=1, alpha=0.05)



