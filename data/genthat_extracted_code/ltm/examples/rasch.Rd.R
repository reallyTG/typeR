library(ltm)


### Name: rasch
### Title: Rasch Model
### Aliases: rasch
### Keywords: multivariate regression

### ** Examples

## The common form of the Rasch model for the 
## LSAT data, assuming that the discrimination
## parameter equals 1
rasch(LSAT, constraint = cbind(ncol(LSAT) + 1, 1))


## The Rasch model for the LSAT data under the 
## normal ogive; to do that fix the discrimination
## parameter to 1.702
rasch(LSAT, constraint = cbind(ncol(LSAT) + 1, 1.702))

## The Rasch model for the LSAT data with
## unconstraint discrimination parameter
rasch(LSAT)

## The Rasch model with (artificially created) 
## missing data
data <- LSAT
data[] <- lapply(data, function(x){
    x[sample(1:length(x), sample(15, 1))] <- NA
    x
})
rasch(data)



