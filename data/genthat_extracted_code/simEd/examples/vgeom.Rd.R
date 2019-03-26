library(simEd)


### Name: vgeom
### Title: Variate Generator for the Geometric Distribution
### Aliases: vgeom Geometric
### Keywords: distribution

### ** Examples

set.seed(8675309)
vgeom(3, prob = 0.3)  # inverts stats::runif using stats::qgeom

set.seed(8675309)
vgeom(3, 0.3, stream = 1) # inverts rstream::rstream.sample using stats::qgeom
vgeom(3, 0.3, stream = 2)

set.seed(8675309)
vgeom(1, 0.3, stream = 1) # inverts rstream::rstream.sample using stats::qgeom
vgeom(1, 0.3, stream = 2)
vgeom(1, 0.3, stream = 1)
vgeom(1, 0.3, stream = 2)
vgeom(1, 0.3, stream = 1)
vgeom(1, 0.3, stream = 2)

set.seed(8675309)
variates <- vgeom(1000, prob = 0.3, stream = 1)
set.seed(8675309)
variates <- vgeom(1000, prob = 0.3, stream = 1, antithetic = TRUE)



