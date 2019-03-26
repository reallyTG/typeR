library(ICAOD)


### Name: sensmultiple
### Title: Verifying Optimality of The Multiple Objective Designs for The
###   4-Parameter Hill Model
### Aliases: sensmultiple

### ** Examples

#################################################################
# Verifying optimality of a design for the 4-parameter Hill model
#################################################################

## initial estiamtes for the parameters of the Hill model
a <- 0.008949  # ED50
b <- -1.79 # Hill constant
c <- 0.137 # lower limit
d <- 1.7 # upper limit
# D belongs to c(.001, 1000) ## dose in mg
## Hill parameters are c(a, b, c, d)
# dose, minDose and maxDose vector in mg scale

sensmultiple (dose = c(0.001, 0.009426562, 0.01973041, 999.9974),
              w =   c(0.4806477, 0.40815, 0.06114173, 0.05006055),
              minDose = .001, maxDose = 1000,
              Hill_par = TRUE,
              inipars = c(a, b, c, d),
              lambda = c(0.05, 0.05, .90),
              delta = -1)





## Don't show: 

## examples fof using this function for c-optimal designs
# first row second column: c-optimal design for estimating ED50 of the 4-parameter logistic model
sensmultiple (dose = c(log(.001), -4.80, log(1000)),
              w = c(.276, .500, .224),
              minDose = log(.001), maxDose = log(1000),
              inipars =  c(d - c, -b, b * log(a), c),
              lambda = c(0, 1, 0),
              delta = -1)
## criterion value is 1e+24 which will be returned when variance for estimating ED50 is comutationaly negative!
## if we change the tolerance for finding  Moore-Penrose Matrix Inverse to .Machine$double.eps
# when get 2.201179 for the criterion value


sensmultiple (dose = c(-6.907755, -4.664224, -3.925594, 6.907753 ),
              w =   c(0.4806477, 0.40815, 0.06114173, 0.05006055 ),
              minDose = log(.001), maxDose = log(1000),
              inipars = c(d - c, -b, b * log(a), c),
              lambda = c(0.05, 0.05, .90),
              delta = -1)
## End(Don't show)



