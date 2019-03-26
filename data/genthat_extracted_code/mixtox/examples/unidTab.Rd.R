library(mixtox)


### Name: unidTab
### Title: Uniform Design Table
### Aliases: unidTab
### Keywords: uniform design good lattice point

### ** Examples

## example 1
# construct uniform table with 11 runs and 7 factors using the default centered L2-discrepancy 
# algorithm
unidTab(11, 7)

## example 2
# construct uniform table with 37 runs and 13 factors using the symmetric discrepancy algorithm 
unidTab(lev = 37, fac = 13, algo = "sd2" )

## example 3
# construct uniform table with 37 runs and 13 factors using default centered L2-discrepancy 
# algorithm
unidTab(lev = 37, fac = 13, algo = "cd2" )



