library(lmomco)


### Name: is.ln3
### Title: Is a Distribution Parameter Object Typed as 3-Parameter
###   Log-Normal
### Aliases: is.ln3
### Keywords: utility (distribution, type check) Distribution: Log-Normal
###   (3-parameter)

### ** Examples

para <- vec2par(c(.9252, .1636, .7),type='ln3')
if(is.ln3(para)) {
  Q <- qualn3(0.5,para)
}



