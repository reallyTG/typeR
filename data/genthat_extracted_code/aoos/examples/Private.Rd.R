library(aoos)


### Name: Private-class
### Title: Private class
### Aliases: Private-class $,Private-method $<-,Private-method
###   [[,Private-method [[<-,Private-method

### ** Examples

ClassWithPrivateField <- defineRefClass({
  Class <- "ClassWithPrivateField"
  contains <- "Private"
  
  .p <- "numeric"
  
  getP <- function() .p
  setP <- function(v) .self$.p <- v
})

test <- ClassWithPrivateField()
stopifnot(inherits(try(test$.p), "try-error"))
stopifnot(inherits(try(test$.p <- 2), "try-error"))
stopifnot(inherits(try(test[[".p"]]), "try-error"))
stopifnot(inherits(try(test[[".p"]] <- 2), "try-error"))



