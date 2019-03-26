library(io)


### Name: qread
### Title: Data input
### Aliases: qread

### ** Examples

## Not run: 
##D data(cars)
##D 
##D # write data to an RDS file
##D qwrite(cars, "cars.rds")
##D # infer output type based on the class of the cars object
##D qwrite(cars, "cars.dfm", type=NA)
##D 
##D # read data back in
##D x1 <- qread("cars.rds")
##D # specify the type explicitly
##D x3 <- qread("cars.dfm", type="data.frame")
##D 
##D # read all files (with extension) in current directory
##D xs <- qread(".", pattern="cars")
## End(Not run)




