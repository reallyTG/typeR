library(lmomco)


### Name: is.lap
### Title: Is a Distribution Parameter Object Typed as Laplace
### Aliases: is.lap
### Keywords: utility (distribution, type check) Distribution: Laplace

### ** Examples

para <- parlap(lmoms(c(123,34,4,654,37,78)))
if(is.lap(para) == TRUE) {
  Q <- qualap(0.5,para)
}



