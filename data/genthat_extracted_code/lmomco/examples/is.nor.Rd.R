library(lmomco)


### Name: is.nor
### Title: Is a Distribution Parameter Object Typed as Normal
### Aliases: is.nor
### Keywords: utility (distribution, type check) Distribution: Normal

### ** Examples

para <- parnor(lmoms(c(123,34,4,654,37,78)))
if(is.nor(para) == TRUE) {
  Q <- quanor(0.5,para)
}



