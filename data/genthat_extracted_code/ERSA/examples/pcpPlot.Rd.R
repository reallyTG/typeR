library(ERSA)


### Name: pcpPlot
### Title: A PCP plot of the data, residuals or hat values from regression
###   fits
### Aliases: pcpPlot

### ** Examples

f <- lm(mpg ~ wt+hp+disp, data=mtcars)
pcpPlot(mtcars, f, type="Residuals")



