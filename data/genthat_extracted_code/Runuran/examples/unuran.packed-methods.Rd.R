library(Runuran)


### Name: unuran.packed-method
### Title: Pack "unuran" object
### Aliases: unuran.packed unuran.packed-method unuran.packed,unuran-method
###   unuran.packed<- unuran.packed<--method unuran.packed<-,unuran-method
### Keywords: methods distribution datagen

### ** Examples

## create a unuran object for half-normal distribution using methed 'PINV'
gen <- pinv.new(dnorm,lb=0,ub=Inf)

## status of object 
unuran.packed(gen)

## draw a random sample of size 10
x <- ur(gen,10)

## pack unuran object
unuran.packed(gen) <- TRUE
unuran.packed(gen)

## draw a random sample of size 10
x <- ur(gen,10)

## Not run: 
##D ## unpacking is not supported
##D unuran.packed(gen) <- FALSE    ## results in error 
## End(Not run)



