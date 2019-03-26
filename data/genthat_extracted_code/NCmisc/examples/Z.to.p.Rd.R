library(NCmisc)


### Name: Z.to.p
### Title: Convert Z-scores to p-values
### Aliases: Z.to.p

### ** Examples

Z.to.p("1.96")
Z.to.p(p.to.Z(0.0001))
Z.to.p(37, TRUE)
Z.to.p(39, TRUE) # maximum precision exceeded, warnings on
Z.to.p(39) # maximum precision exceeded, warnings off



