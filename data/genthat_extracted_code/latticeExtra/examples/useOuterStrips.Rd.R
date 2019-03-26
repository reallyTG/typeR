library(latticeExtra)


### Name: useOuterStrips
### Title: Put Strips on the Boundary of a Lattice Display
### Aliases: useOuterStrips
### Keywords: dplot

### ** Examples


library(lattice)

mtcars$HP <- equal.count(mtcars$hp)

useOuterStrips(xyplot(mpg ~ disp | HP + factor(cyl), mtcars))

useOuterStrips(xyplot(mpg ~ disp | factor(cyl) + HP, mtcars),
               strip.left = FALSE,
               strip = strip.custom(style = 4))




