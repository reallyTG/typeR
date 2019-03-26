library(nlsem)


### Name: qml
### Title: Quasi-maximum likelihood estimation of a nonlinear structural
###   equation model
### Aliases: qml

### ** Examples

# specify model of class singleClass
sc <- specify_sem(num.x=4, num.y=2, num.xi=2, num.eta=1, xi="x1-x2,x3-x4",
                  eta="y1-y2", interaction="eta1~xi1:xi2") 

# simulate data
pars.orig <- c(0.6, 0.7,                 # Lx
               0.8,                      # Ly
               0.2, 0.4,                 # G
               0.25, 0.25, 0.25, 0.25,   # Td
               0.25, 0.25,               # Te
               0.2,                      # Psi
               0.49, 0.235, 0.64,        # Phi
               0, 0,                     # nu.x
               0,                        # nu.x
               1,                        # alpha
               1, 1,                     # tau
               0.7                       # Omega
              )

dat <- simulate(sc, parameters=pars.orig, seed=81)

# fit model
set.seed(1609)
start <- runif(count_free_parameters(sc))
## Not run: 
##D qml1 <- qml(sc, dat, start)
##D summary(qml1)
## End(Not run)



