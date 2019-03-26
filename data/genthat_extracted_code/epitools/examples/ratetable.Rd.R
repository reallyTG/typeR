library(epitools)


### Name: ratetable
### Title: Create r x 2 count and person-time table for calculating rates
### Aliases: ratetable
### Keywords: manip

### ** Examples

##Breast cancer cases from radiation treatment for tuberculosis
##Rothman 1998, p. 238
bc0 <- 15
bc1 <- 41
py0 <- 19017
py1 <- 28010

##4 numbers
ratetable(bc0, py0, bc1, py1)

##1 vector
dat <- c(bc0, py0, bc1, py1)
ratetable(dat)

##2 vectors
cases <- c(bc0, bc1)
pyears <- c(py0, py1)
ratetable(bc.cases = cases, person.years = pyears)

##1 matrix
r238 <- matrix(c(41, 28010, 15, 19017), 2, 2)
dimnames(r238) <- list(c("BC cases", "Person-years"),
                       "Radiation" = c("Yes", "No"))
r238
r238b <- t(r238)
r238b
ratetable(r238b, rev = "r")




