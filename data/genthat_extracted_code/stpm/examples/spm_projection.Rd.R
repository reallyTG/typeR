library(stpm)


### Name: spm_projection
### Title: A data projection with previously estimated or user-defined
###   parameters. Projections are constructed for a cohort with fixed or
###   normally distributed initial covariates.
### Aliases: spm_projection

### ** Examples

## Not run: 
##D  
##D library(stpm)
##D # Setting up the model
##D model.par <- list()
##D model.par$a <- matrix(c(-0.05, 1e-3, 2e-3, -0.05), nrow=2, ncol=2, byrow=TRUE)
##D model.par$f1 <- matrix(c(90, 35), nrow=1, ncol=2)
##D model.par$Q <- matrix(c(1e-8, 1e-9, 1e-9, 1e-8), nrow=2, ncol=2, byrow=TRUE)
##D model.par$f <- matrix(c(80, 27), nrow=1, ncol=2)
##D model.par$b <- matrix(c(6, 2), nrow=2, ncol=2)
##D model.par$mu0 <- 1e-6
##D model.par$theta <- 0.09
##D # Projection
##D # Discrete-time model
##D data.proj.discrete <- spm_projection(model.par, N=5000, ystart=c(80, 27))
##D plot(data.proj.discrete$stat$srv.prob)
##D # Continuous-time model
##D data.proj.continuous <- spm_projection(model.par, N=5000, 
##D ystart=c(80, 27), model="continuous")
##D plot(data.proj.continuous$stat$srv.prob)
##D # Time-dependent model
##D model.par <- list(at = "-0.05", f1t = "80", Qt = "2e-8", 
##D ft= "80", bt = "5", mu0t = "1e-5*exp(0.11*t)")
##D data.proj.time_dependent <- spm_projection(model.par, N=500, 
##D ystart=80, model="time-dependent")
##D plot(data.proj.time_dependent$stat$srv.prob, xlim = c(30,105))
## End(Not run)



