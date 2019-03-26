library(OmicsPLS)


### Name: o2m2
### Title: Perform O2-PLS with two-way orthogonal corrections
### Aliases: o2m2
### Keywords: internal

### ** Examples

# This takes a couple of seconds on an intel i5
system.time(
             o2m2(matrix(rnorm(50*2000),50),matrix(rnorm(50*2000),50),1,0,0)
)

# This however takes 10 times as much...
# system.time(
#              o2m(matrix(rnorm(50*2000),50),matrix(rnorm(50*2000),50),1,0,0,
#              p_thresh = 1e4,q_thresh = 1e4)  # makes sure power method is not used
# )




