library(multiplex)


### Name: bundle.census
### Title: Bundle Census
### Aliases: bundle.census
### Keywords: data

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.8, 3 ) )

## Calculate the Bundle Census
bundle.census(arr)




