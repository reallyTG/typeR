library(lessR)


### Name: regPlot
### Title: regPlot Analysis
### Aliases: regPlot
### Keywords: regPlot

### ** Examples

# read internal data set
d <- rd("Reading", in.lessR=TRUE, quiet=TRUE)
# do regression analysis, save result into out
reg.out <- reg(Reading ~ Verbal)
# The full output already contains these plots, obtained by
# entering the name of the saved object
reg.out
# Particularly for knitr it is useful to obtain the plots
#   separately from the full output
# Get the scatter plot of the data with the regression line
#   and prediction and confidence intervals 
regPlot(reg.out, 1)

# Can use with multiple regression for the scatter plot matrix
r <- reg(Reading ~ Verbal + Absent + Income)
regPlot(r, 1, scatter.coef=TRUE)



