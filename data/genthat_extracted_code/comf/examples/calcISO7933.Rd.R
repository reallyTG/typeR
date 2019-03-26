library(comf)


### Name: calcIso7933
### Title: Calculating Heat Strain Indices based on ISO 7933
### Aliases: calcIso7933 calcISO7933 calcTre calcSWtotg calcDlimtre
###   calcDlimloss50 calcDlimloss95
### Keywords: manip

### ** Examples

## Calculation of a single set of values.
calcIso7933(accl = 100, posture = 2, Ta = 35, Pa = 4, Tr = 35, Va = 0.3, Met = 150, 
Icl = 0.5, THETA = 0, Walksp = 0, Duration = 480)

calcIso7933(100,2,35,4,35,0.3,150,0.5,0,0,480)
## Using several rows of data:
accl <- 100
posture <- 2
Ta <- c(40,35)
Pa <- c(2.5,4)
Tr <- c(40,35)
Va <- 0.3
Met <- 150
Icl <- 0.5
THETA <- 0
Walksp <- 0
Duration <- 480
maxLength <- max(sapply(list(accl, posture, Ta, Pa, Tr, Va, Met, Icl, THETA, Walksp, 
Duration), length))

PHI <- sapply(seq(maxLength), function(x) {calcIso7933(accl, posture, Ta[x], Pa[x], 
Tr[x], Va, Met, Icl, THETA, Walksp, Duration) } ) 



