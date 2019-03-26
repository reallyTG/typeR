library(diptest)


### Name: statfaculty
### Title: Faculty Quality in Statistics Departments
### Aliases: statfaculty
### Keywords: datasets

### ** Examples

data(statfaculty)
plot(dH <- density(statfaculty))
rug(jitter(statfaculty))

data(exHartigan)
stopifnot(identical(exHartigan,statfaculty))



