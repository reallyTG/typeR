library(wiqid)


### Name: Occupancy Single Season
### Title: Single-season occupancy estimation
### Aliases: occSS0 occSStime occSScovSite occSS

### ** Examples

# The blue ridge salamanders data from MacKenzie et al (2006) p99:
data(salamanders)
occSS(salamanders)
occSStime(salamanders, p ~ .time)  # time as a fixed effect
occSStime(salamanders, p ~ .Time + I(.Time^2))  # a quadratic time effect
occSS(salamanders, p ~ .b)

# or use the fast functions with y, n format:
y <- rowSums(salamanders)
n <- rowSums(!is.na(salamanders))
occSS0(y, n)
occSScovSite(y, n)




