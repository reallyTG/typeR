library(vcd)


### Name: spacings
### Title: Spacing-generating Functions
### Aliases: spacings spacing_highlighting spacing_equal spacing_dimequal
###   spacing_increase spacing_conditional
### Keywords: hplot

### ** Examples

data("Titanic")
strucplot(Titanic, spacing = spacing_increase(start = 0.5, rate = 1.5))
strucplot(Titanic, spacing = spacing_equal(1))
strucplot(Titanic, spacing = spacing_dimequal(1:4 / 4))
strucplot(Titanic, spacing = spacing_highlighting,
                   gp = gpar(fill = c("light gray","dark gray")))
data("PreSex")
strucplot(aperm(PreSex, c(1,4,2,3)), spacing = spacing_conditional,
          condvars = 2)  



