library(mvbutils)


### Name: strip.missing
### Title: Exclude "missing" objects
### Aliases: strip.missing
### Keywords: programming

### ** Examples

funco <- function( first, second, third) {
  a <- 9
  return( do.call("returnList", lapply( strip.missing( ls()), as.name)))
}
funco( 1) # list( a=9, first=1)
funco( second=2) # list( a=9, second=2)
funco( ,,3) # list( a=9, third=3)
funco2 <- function( first=999) {
  a <- 9
  return( do.call("returnList", lapply( strip.missing( ls()), as.name)))
}
funco2() # list( a=9, first=999) even tho' "first" was not set



