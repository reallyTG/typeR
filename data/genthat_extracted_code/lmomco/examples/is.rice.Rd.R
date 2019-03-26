library(lmomco)


### Name: is.rice
### Title: Is a Distribution Parameter Object Typed as Rice
### Aliases: is.rice
### Keywords: utility (distribution, type check) Distribution: Rice

### ** Examples

para <- vec2par(c(3, 4),type='rice')
if(is.rice(para)) {
  Q <- quarice(0.5,para)
}



