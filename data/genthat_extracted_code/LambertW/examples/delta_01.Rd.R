library(LambertW)


### Name: delta_01
### Title: Input parameters to get zero mean, unit variance output given
###   delta
### Aliases: delta_01
### Keywords: math univar

### ** Examples


delta_01(0) # for delta = 0, input == output, therefore (0,1,0,0,1)
# delta > 0 (heavy-tails): 
#   Y is symmetric for all delta: 
#   mean = 0; however, sd must be smaller 
delta_01(0.1) 
delta_01(1/3)  # only moments up to order 2 exist
delta_01(1)  # neither mean nor variance exist, thus NA



