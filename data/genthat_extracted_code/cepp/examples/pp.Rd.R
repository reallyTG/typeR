library(cepp)


### Name: pp
### Title: Creates the projection pursuit function.
### Aliases: pp

### ** Examples

##Exploring structure in the RANDU data
##Or using the MINSTD generator
randu <- as.matrix(randu)

randtoolbox::setSeed(570)
w <- randtoolbox::congruRand(1200)
dim(w) <- c(3, 400)
w <- t(w)

m <- 'geodesic'
a <- 0.50

ranif1 <- pp(r=1, n=50, data=randu, oth=w, k=2)

set.seed(50)
F1 <- basis_random(3)
o1 <- optim(par=F1, fn=ranif1, gr=basis_nearby(), method='SANN',
            control=list(fnscale=-1, maxit=100, trace=1))
plot(randu %*% o1$par)

##How accurate are the values?
ranif1hi <- pp(r=1, n=500, data=randu, oth=w, k=2)
ranif1hi(o1$par)



