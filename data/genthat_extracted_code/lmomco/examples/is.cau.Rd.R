library(lmomco)


### Name: is.cau
### Title: Is a Distribution Parameter Object Typed as Cauchy
### Aliases: is.cau
### Keywords: utility (distribution, type check) Distribution: Cauchy

### ** Examples

para <- vec2par(c(12,12),type='cau')
if(is.cau(para) == TRUE) {
  Q <- quacau(0.5,para)
}



