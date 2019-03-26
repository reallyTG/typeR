library(lmomco)


### Name: is.pe3
### Title: Is a Distribution Parameter Object Typed as Pearson Type III
### Aliases: is.pe3
### Keywords: utility (distribution, type check) Distribution: Pearson Type
###   III

### ** Examples

para <- parpe3(lmoms(c(123,34,4,654,37,78)))
if(is.pe3(para) == TRUE) {
  Q <- quape3(0.5,para)
}



