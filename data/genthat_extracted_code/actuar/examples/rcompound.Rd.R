library(actuar)


### Name: rcompound
### Title: Simulation from Compound Models
### Aliases: rcompound rcomppois
### Keywords: datagen

### ** Examples

## Compound Poisson model with gamma severity.
rcompound(10, rpois(2), rgamma(2, 3))
rcomppois(10, 2, rgamma(2, 3))          # same

## Frequencies and individual claim amounts along with aggregate
## values.
rcomppois(10, 2, rgamma(2, 3), SIMPLIFY = FALSE)

## Wrapping the simulation models into expression() is allowed, but
## not needed.
rcompound(10, expression(rpois(2)), expression(rgamma(2, 3)))

## Not run: 
##D ## Speed comparison between rcompound() and rcomphierarc().
##D ## [Also note the simpler syntax for rcompound().]
##D system.time(rcompound(1e6, rpois(2), rgamma(2, 3)))
##D system.time(rcomphierarc(1e6, expression(rpois(2)), expression(rgamma(2, 3))))
## End(Not run)
## The severity can itself be a compound model. It makes sense
## in such a case to use a zero-truncated frequency distribution
## for the second level model.
rcomppois(10, 2,
          rcompound(rztnbinom(1.5, 0.7), rlnorm(1.2, 1)))



