library(SciViews)


### Name: correlation
### Title: Correlation matrices.
### Aliases: correlation Correlation correlation.formula
###   correlation.default is.Correlation is.correlation as.Correlation
###   as.correlation print.Correlation summary.Correlation
###   print.summary.Correlation plot.Correlation lines.Correlation
### Keywords: distribution

### ** Examples

# This is a simple correlation coefficient
cor(rnorm(10), runif(10))
Correlation(rnorm(10), runif(10))

# 'Correlation' objects allow better inspection of the correlation matrices
# than the output of default R cor() function
(longley.cor <- Correlation(longley))
summary(longley.cor) # Synthetic view of the correlation matrix
plot(longley.cor)    # Graphical representation

# Use of the formula interface
(mtcars.cor <- Correlation(~ mpg + cyl + disp + hp, data = mtcars,
  method = "spearman", na.action = "na.omit"))

mtcars.cor2 <- Correlation(mtcars, method = "spearman")
print(mtcars.cor2, cutoff = 0.6)
summary(mtcars.cor2)
plot(mtcars.cor2, type = "lower")

mtcars.cor2["mpg", "cyl"] # Extract a correlation from the correlation matrix



