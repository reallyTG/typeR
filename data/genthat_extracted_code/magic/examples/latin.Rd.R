library(magic)


### Name: latin
### Title: Random latin squares
### Aliases: latin incidence is.incidence is.incidence.improper unincidence
###   inc_to_inc another_latin another_incidence rlatin
### Keywords: array

### ** Examples


rlatin(5)
rlatin(n=2, size=4, burnin=10)

# An example that allows one to optimize an objective function
# [here f()] over latin squares:
gr <- function(x){ another_latin(matrix(x,7,7)) }
set.seed(0)
index <- sample(49,20)
f <- function(x){ sum(x[index])}
jj <- optim(par=as.vector(latin(7)), fn=f, gr=gr, method="SANN", control=list(maxit=10))
best_latin <- matrix(jj$par,7,7)
print(best_latin)
print(f(best_latin))

#compare starting value:
f(circulant(7))





