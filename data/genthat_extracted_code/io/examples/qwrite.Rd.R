library(io)


### Name: qwrite
### Title: Data output
### Aliases: qwrite

### ** Examples

## Not run: 
##D data(cars)
##D 
##D # write data to a TSV file
##D qwrite(cars, "cars.tsv")
##D # infer output type based on the class of the cars object
##D qwrite(as.matrix(cars), "cars.mtx", type=NA)
## End(Not run)




