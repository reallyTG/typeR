library(gvcm.cat)


### Name: index
### Title: Functions to Build Design Matrices and Indices for Function
###   gvcm.cat()
### Aliases: index design
### Keywords: gvcm.cat

### ** Examples

## example for function simulation()
covariates <- list(x1=list("unif", c(0,2)),
                  x2=list("unif", c(0,2)),
                  x3=list("unif", c(0,2)),
                  u=list("multinom",c(0.3,0.4,0.3), "nominal")
                  )
true.f <- y ~ 1 + v(x1,u) + x2
true.coefs <- c(0.2,  0.3,.7,.7, -.5)
data <- simulation(400, covariates, NULL, true.f, true.coefs , binomial(), seed=456)
## example for function index()
f <- y ~ v(1,u) + v(x1,u) + v(x2,u)
dsgn <- design(f, data)
index(dsgn, data)



