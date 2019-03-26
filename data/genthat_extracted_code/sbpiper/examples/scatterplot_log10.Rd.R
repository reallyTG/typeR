library(sbpiper)


### Name: scatterplot_log10
### Title: Plot a generic scatter plot in log10 scale
### Aliases: scatterplot_log10

### ** Examples

df <- data.frame(a=exp(rnorm(10000)), b=exp(rnorm(10000)))
scatterplot_log10(df, colNameX="a", colNameY="b")



