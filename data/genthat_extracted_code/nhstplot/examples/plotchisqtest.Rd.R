library(nhstplot)


### Name: plotchisqtest
### Title: Illustrate a Chi-Squared Test graphically.
### Aliases: plotchisqtest

### ** Examples

#Making a chi-squared plot with Chi-squared of 8 and df of 4
plotchisqtest(chisq = 8, df = 4)

#Note that the same can be obtained even quicker with:
plotchisqtest(8,4)

#The same plot without the Chi-Squared or p value
plotchisqtest(8,4, blank = TRUE)

#Changing the fontfamily to "sans" and changing the color theme to "blackandwhite"
plotchisqtest(chisq = 8, df = 4, fontfamily = "sans", theme = "blackandwhite")

#Using specific colors and changing the curve line size
plotchisqtest(chisq = 8, df = 4, colorleft = "grey", colorright = "indianred", curvelinesize = 1.2)

#Changing the title to "Chi-Squared Test of Independence"
plotchisqtest(chisq = 8, df = 4, title = "Chi-Squared Test of Independence")

#Changing the title to "Chi-Squared Test of Independence" with greek chi-squared
plotchisqtest(chisq = 8, df = 4, title = expression(chi^2 ~ "Test" ~ "of" ~ "Independence"))




