library(epitools)


### Name: epitable
### Title: Create r x c contigency table (exposure levels vs. binary
###   outcome)
### Aliases: epitable
### Keywords: manip

### ** Examples

## single vector
dat <- c(88, 20, 555, 347)
epitable(dat)

## 4 or more integers
epitable(1,2,3,4,5,6)

## single matrix
epitable(matrix(1:6, 3, 2))

## two categorical vectors
exposure <- factor(sample(c("Low", "Med", "High"), 100, rep=TRUE),
                   levels=c("Low", "Med", "High"))
outcome <- factor(sample(c("No", "Yes"), 100, rep=TRUE))
epitable(exposure, outcome)
epitable("Exposure"=exposure, "Disease"=outcome)

## reversing row and/or column order
zz <- epitable("Exposure Level"=exposure, "Disease"=outcome)
zz
epitable(zz, rev = "r")
epitable(zz, rev = "c")
epitable(zz, rev = "b")




