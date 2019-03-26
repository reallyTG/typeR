library(beginr)


### Name: plotpairs2
### Title: plot pair-wise correlations with p value. in: a dataframe. out:
###   a figure.
### Aliases: plotpairs2

### ** Examples

df <- data.frame(a = 1:10, b = 1:10 + rnorm(10), c = 1:10 + rnorm(10))
plotpairs2(df)



