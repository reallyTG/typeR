library(popkin)


### Name: weightsSubpops
### Title: Get weights for individuals that balance subpopulations
### Aliases: weightsSubpops

### ** Examples

# if every individual has a different subpopulation, weights are uniform:
subpops <- 1:10
w <- weightsSubpops(subpops)
stopifnot(all(w == rep.int(1/10,10)))

# subpopulations can be strings too
subpops <- c('a', 'b', 'c')
w <- weightsSubpops(subpops)
stopifnot(all(w == rep.int(1/3,3)))

# if there are two subpopulations
# and the first has twice as many individuals as the second
# then the individuals in this first subpopulation weight half as much 
# as the ones in the second subpopulation
subpops <- c(1, 1, 2)
w <- weightsSubpops(subpops)
stopifnot(all(w == c(1/4,1/4,1/2)))




