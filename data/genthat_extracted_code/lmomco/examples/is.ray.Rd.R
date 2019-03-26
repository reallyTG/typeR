library(lmomco)


### Name: is.ray
### Title: Is a Distribution Parameter Object Typed as Rayleigh
### Aliases: is.ray
### Keywords: utility (distribution, type check) Distribution: Rayleigh

### ** Examples

para <- vec2par(c(.9252, .1636, .7),type='ray')
if(is.ray(para)) {
  Q <- quaray(0.5,para)
}



