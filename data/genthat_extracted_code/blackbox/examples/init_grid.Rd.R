library(blackbox)


### Name: init_grid
### Title: Define starting points in parameter space.
### Aliases: init_grid

### ** Examples

set.seed(123)
init_grid()
init_grid(lower=c(mu=2.8,s2=0.5,sample.size=20),
          upper=c(mu=5.2,s2=4.5,sample.size=20),
          steps=c(mu=7,s2=9),nUnique=63)



