library(vcd)


### Name: strucplot
### Title: Structured Displays of Contingency Tables
### Aliases: strucplot
### Keywords: hplot

### ** Examples

data("Titanic")

strucplot(Titanic)
strucplot(Titanic, core = struc_assoc)
strucplot(Titanic, spacing = spacing_increase,
                   spacing_args = list(start = 0.5, rate = 1.5))
strucplot(Titanic, spacing = spacing_increase(start = 0.5, rate = 1.5))

## modify a tile's color
strucplot(Titanic, pop = FALSE)
grid.edit("rect:Class=1st,Sex=Male,Age=Adult,Survived=Yes",
          gp = gpar(fill = "red"))



