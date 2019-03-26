library(coenocliner)


### Name: expand
### Title: An 'expand.grid'-like function that repeats sets of vectors for
###   every value in a reference vector.
### Aliases: expand
### Keywords: utilities

### ** Examples

# Recreate Fig. 2 of Minchin (1987)
# Parameters for each of 6 six species
A0 <- c(5,4,7,5,9,8) * 10
m <- c(25,85,10,60,45,60)
r <- c(3,3,4,4,6,5) * 10
alpha <- c(0.1,1,2,4,1.5,1)
gamma <- c(0.1,1,2,4,0.5,4)
# Gradient locations
x <- 1:100

# expand parameter set
pars <- expand(x, m = m, A0 = A0, r = r, alpha = alpha,
               gamma = gamma)
head(pars)



