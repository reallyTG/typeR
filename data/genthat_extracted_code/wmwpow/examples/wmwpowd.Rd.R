library(wmwpow)


### Name: wmwpowd
### Title: Power Calculation with wmwpowd
### Aliases: wmwpowd

### ** Examples

# 1. We want to determine the statistical power to compare body length measured on two groups of
# rabbits. Each group (X and Y) has 7 rabbits. We assume that body length will be normally 
# distributed and have a constant standard deviation of 2 cm among groups. We assume that Group X 
# will have a mean of 35 cm and Group Y will have a mean of 32 cm; the desired type I error is 0.05.

## No test: 
wmwpowd(n = 7, m = 7, distn = "norm(35,2)", distm = "norm(32,2)", sides = "two.sided", 
        alpha = 0.05, nsims=10000)
## End(No test)
        
## Don't show: 
wmwpowd(n = 5, m = 5, distn = "norm(35,2)", distm = "norm(32,2)", sides = "two.sided", 
        alpha = 0.05, nsims=100)
## End(Don't show)

# 2. We are interested in determining the statistical power (with type I error = 0.05) for a
# comparison of the use of ornamentation among fiddle players living in two regions of the United 
# States: X county, Texas and Y county, North Carolina. A random sample of 18 fiddlers will be 
# collected within each state. The fiddlers will practice and perform a standardized version of the 
# Tennessee Waltz. The proportion of melody notes that are ornamented (including vibrato) will be 
# calculated. We assume that the proportion will follow a beta distribution with a mean of 0.40 and 
# a shape well described by alpha = 8 and beta = 12 among the Texas fiddlers. We assume that 
# the distribution will be shifted to a lower mean of 0.25 and have the shape alpha = 2, 
# beta = 6 for the North Carolina fiddlers.

## No test: 
wmwpowd(n=18, m=18, distn = "beta(8,12)", distm = "beta(2,6)", sides = "two.sided", 
        alpha = 0.05, nsims=10000)
## End(No test)
        
## Don't show: 
wmwpowd(n=5, m=5, distn = "beta(8,12)", distm = "beta(2,6)", sides = "two.sided", 
        alpha = 0.05, nsims=100)
## End(Don't show)



