library(LifeTables)


### Name: lt.mx
### Title: Life tables from nmx
### Aliases: lt.mx
### Keywords: misc methods

### ** Examples

# some data to build the table
data(MLTobs)
test.mx.m <- mlt.mx[,1]

# build the life table
lt.mx(nmx=test.mx.m, sex="male")

# another example with female data ages 0-85
test.mx.f <- flt.mx[1:19,1] ## ages 0-85
lt.mx(nmx=test.mx.f, sex="female", age=c(0,1,seq(5,85,5)))
        


