library(pems.utils)


### Name: 3.1.1.common.calculations
### Title: Common calculations
### Aliases: 3.1.1.common.calculations common.calculations calcDistance
###   calcSpeed calcAccel calcAcceleration calcJerk calcChecks calcPack
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#basic usage

#calculated accel as pems.element

calcAccel(velocity, local.time, pems.1)

#answer returned as suppied pems + calculated accel

calcAccel(velocity, local.time, pems.1, output = "pems")

#or, if you would rather... 
## Not run: 
##D pems.1$accel <- calcAccel(velocity, local.time, pems.1)
## End(Not run)

###########
#example 2
###########

#making wrappers for routine data processing 

my.pems <- list(pems.1, pems.1)

sapply(my.pems, function(x) 
                  calcAccel(velocity, local.time, data=x))

#ans = accel data series for each pems in my.pems list

#             [,1]        [,2]
# [1,]          NA          NA
# [2,]  0.00000000  0.00000000
# [3,]  0.05555556  0.05555556
# [4,]  0.00000000  0.00000000
# [5,] -0.02777778 -0.02777778
# [6,]  0.05555556  0.05555556
#       ....

#note:
#sapply if you can/want to simiplify outputs
#lapply if you want to keep output as a list of answers




