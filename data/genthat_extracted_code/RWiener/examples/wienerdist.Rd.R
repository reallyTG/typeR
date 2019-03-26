library(RWiener)


### Name: wienerdist
### Title: Wiener process distribution functions
### Aliases: dwiener pwiener qwiener rwiener
### Keywords: dwiener pwiener qwiener rwiener

### ** Examples

## calculate density for reactiontime 1.45, upper bound and some parameters
dwiener(1.45, 2,0.3,0.5,0)

## calculate CDF for reactiontime 1.45, upper bound and some parameters
pwiener(1.45, 2,0.3,0.5,0)

## calculate quantile for CDF value of 0.5, upper bound and some parameters
qwiener(0.5, 2,0.3,0.5,0)

## generate one random value
rwiener(1, 2,0.3,0.5,0)



