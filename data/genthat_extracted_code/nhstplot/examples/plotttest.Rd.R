library(nhstplot)


### Name: plotttest
### Title: Illustrate a one- or two-tailed Student's t test graphically.
### Aliases: plotttest

### ** Examples

#Making a t test plot with a t value of 2 and df of 10
plotttest(t = 2, df = 10)

#Note that the same can be obtained even quicker with:
plotttest(2,10)

#The same plot without the t or p value
plotttest(2,10, blank = TRUE)

#Plotting a one-tailed test using the "tails" parameter.
plotttest(t = 2, df = 10, tails = "one")

#If a negative t is provided, the tail is on the left.
plotttest(t = -2, df = 10, tails = "one")

#Changing the fontfamily to "sans" and changing the color theme to "blackandwhite".
plotttest(t = 2, df = 10, fontfamily = "sans", theme = "blackandwhite")

#Using specific colors and changing the curve line size
plotttest(t = 2, df = 10, colormiddle = "grey96", colorsides = "indianred", curvelinesize=1)




