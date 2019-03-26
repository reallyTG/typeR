library(stackoverflow)


### Name: unscale
### Title: Reverse a scale
### Aliases: unscale

### ** Examples

 mtcs <- scale(mtcars)
 
 all.equal(
   unscale(mtcs), 
   as.matrix(mtcars), 
   check.attributes=FALSE
 )
 
 oldSeed <- .Random.seed
 z <- unscale(rnorm(10), 2, .5)
 .Random.seed <- oldSeed
 x <- rnorm(10, 2, .5)
 all.equal(z, x, check.attributes=FALSE)





