library(rngWELL)


### Name: pseudo.rngWELL
### Title: Toolbox for pseudo and quasi random number generation
### Aliases: pseudo.rngWELL WELL2test setSeed4WELL doinitMT2002
###   doputRngWELL dogetRngWELL
### Keywords: distribution

### ** Examples

# (1) WELL generator
#

# 'basic' calls
# WELL512
WELL2test(10, order = 512)
# WELL1024
WELL2test(10, order = 1024)
# WELL19937
WELL2test(10, order = 19937)
# WELL44497
WELL2test(10, order = 44497)
# WELL19937 with tempering 
WELL2test(10, order = 19937, temper = TRUE)
# WELL44497 with tempering
WELL2test(10, order = 44497, temper = TRUE)

# tempering vs no tempering
setSeed4WELL(08082008)
WELL2test(10, order =19937)
setSeed4WELL(08082008)
WELL2test(10, order =19937, temper=TRUE)


# (2) other tests
#
doinitMT2002(1, 10, 10)




