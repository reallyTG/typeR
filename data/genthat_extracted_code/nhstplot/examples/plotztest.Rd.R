library(nhstplot)


### Name: plotztest
### Title: Illustrate a one- or two-tailed z test graphically.
### Aliases: plotztest

### ** Examples

#Making a z test plot with a z value of 2.
plotztest(z = 2)

#Note that the same can be obtained even quicker with:
plotztest(2)

#The same plot without the z or p value
plotztest(2, blank = TRUE)

#Plotting a one-tailed test using the "tails" parameter.
plotztest(z = 2, tails = "one")

#If a negative t is provided, the tail is on the left.
plotztest(z = -2, tails = "one")

#Changing the fontfamily to "sans" and changing the color theme to "blackandwhite"
plotztest(z = 2, fontfamily = "sans", theme = "blackandwhite")

#Using specific colors and changing the curve line size
plotztest(z = 2, colormiddle = "grey96", colorsides = "indianred", curvelinesize=1)




