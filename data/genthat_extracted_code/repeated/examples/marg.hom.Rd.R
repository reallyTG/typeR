library(repeated)


### Name: marg.hom
### Title: Marginal Homogeneity Models
### Aliases: marg.hom print.marginal
### Keywords: models

### ** Examples


# 4x4x2 table in Freq, with margins indexed by Left and Right
Freq <- rpois(32,10)
Left <- gl(4,1,32)
Right <- gl(4,4,32)
marg.hom(Freq, Left, Right)




