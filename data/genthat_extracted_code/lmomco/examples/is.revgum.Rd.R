library(lmomco)


### Name: is.revgum
### Title: Is a Distribution Parameter Object Typed as Reverse Gumbel
### Aliases: is.revgum
### Keywords: utility (distribution, type check) Distribution: Gumbel
###   (reversed)

### ** Examples

para <- vec2par(c(.9252, .1636, .7),type='revgum')
if(is.revgum(para)) {
  Q <- quarevgum(0.5,para)
}



