library(lmomco)


### Name: is.kur
### Title: Is a Distribution Parameter Object Typed as Kumaraswamy
### Aliases: is.kur
### Keywords: utility (distribution, type check) Distribution: Kumaraswamy

### ** Examples

para <- parkur(lmoms(c(0.25, 0.4, 0.6, 0.65, 0.67, 0.9)))
if(is.kur(para) == TRUE) {
  Q <- quakur(0.5,para)
}



