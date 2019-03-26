library(pks)


### Name: endm
### Title: Responses and Knowledge Structures from Heller and Wickelmaier
###   (2013)
### Aliases: endm
### Keywords: datasets

### ** Examples

data(endm)
endm$K    # true knowledge structure
endm$K2   # misspecified knowledge structure
endm$N.R  # response patterns

## Generate data from BLIM based on K
blim0 <- list(
     P.K = setNames(c(.1, .15, .15, .2, .2, .1, .1), as.pattern(endm$K)),
    beta = rep(.1, 4),
     eta = rep(.1, 4),
       K = endm$K,
  ntotal = 200)
class(blim0) <- "blim"
simulate(blim0)

## Fit BLIM based on K2
blim1 <- blim(endm$K2, endm$N.R, "MD")



