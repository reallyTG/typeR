library(comf)


### Name: calcTroin
### Title: Calculation of Radiative and Operative Temperature
### Aliases: calcTroin Troin troin
### Keywords: manip

### ** Examples

## Note. Due to random generated asv values. The values for the coefficients will not be meaningful.
## Create sample data
ta  <- 20:24      # vector with air temperature values
vel <- rep(.1,5)  # vector with air velocities
met <- rep(1.1,5) # vector with metabolic rates
tg <- 25:29       # vector with globe temperature values

calcTroin(vel, tg, ta, met)




