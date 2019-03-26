library(lmomco)


### Name: is.kmu
### Title: Is a Distribution Parameter Object Typed as Kappa-Mu
### Aliases: is.kmu
### Keywords: utility (distribution, type check) Distribution: Kappa-Mu

### ** Examples

para <- vec2par(c(3.1, 1.4), type='kmu')
if(is.kmu(para)) {
  Q <- quakmu(0.5,para)
}



