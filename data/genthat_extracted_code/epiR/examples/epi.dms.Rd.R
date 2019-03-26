library(epiR)


### Name: epi.dms
### Title: Decimal degrees and degrees, minutes and seconds conversion
### Aliases: epi.dms
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## Degrees, minutes, seconds to decimal degrees:
dat <- matrix(c(41, 38, 7.836, -40, 40, 27.921), 
   byrow = TRUE, nrow = 2)
epi.dms(dat)

## EXAMPLE 2: 
## Decimal degrees to degrees, minutes, seconds:
dat <- matrix(c(41.63551, -40.67442), nrow = 2)
epi.dms(dat)




