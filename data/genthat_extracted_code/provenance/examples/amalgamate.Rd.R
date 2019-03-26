library(provenance)


### Name: amalgamate
### Title: Group components of a composition
### Aliases: amalgamate amalgamate.default amalgamate.compositional
###   amalgamate.counts amalgamate.SRDcorrected

### ** Examples

data(Namib)
HMcomponents <- c("zr","tm","rt","TiOx","sph","ap","ep",
                  "gt","st","amp","cpx","opx")
am <- amalgamate(Namib$PTHM,feldspars=c("KF","P"),
                 lithics=c("Lm","Lv","Ls"),heavies=HMcomponents)
plot(ternary(am))



