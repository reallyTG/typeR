library(nhstplot)


### Name: plotftest
### Title: Illustrate a Fisher's F Test graphically.
### Aliases: plotftest

### ** Examples

#Making an F plot with an F of 3, and degrees of freedom of 1 and 5.
plotftest(f = 4, dfnum = 3, dfdenom = 5)

#Note that the same can be obtained even quicker with:
plotftest(4,3,5)

#The same plot without the f or p value
plotftest(4,3,5, blank = TRUE)

#Changing the fontfamily to "sans" and changing the color theme to "blackandwhite"
plotftest(f = 4, dfnum = 3, dfdenom = 5, fontfamily = "sans", theme = "blackandwhite")

#Using specific colors and changing the curve line size
plotftest(4, 3, 5, colorleft = "grey", colorright = "indianred", curvelinesize = 1.2)

#Changing the title to "Fisher's F test"
plotftest(f = 4, dfnum = 3, dfdenom = 5, title = "Fisher's F test")




