library(sybil)


### Name: sybilStack
### Title: A Data Type Providing Stack (LIFO) And Queue (FIFO)
###   Functionality
### Aliases: sybilStack stinit stclear stpush stpop stunshift stshift
###   stseek stfirst stlist stlength stexists

### ** Examples

  ## initialize empty stack named test
  stinit("test")

  ## add a few elemets
  stpush("test", 9)
  stpush("test", 3)
  stpush("test", 7)

  ## get last element
  stpop("test")

  ## remove stack
  stclear("test")



