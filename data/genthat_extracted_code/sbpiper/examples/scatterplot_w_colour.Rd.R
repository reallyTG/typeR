library(sbpiper)


### Name: scatterplot_w_colour
### Title: Plot a scatter plot using a coloured palette
### Aliases: scatterplot_w_colour

### ** Examples

df <- data.frame(a=rnorm(10000), b=rnorm(10000), c=rev(seq(10000)))
scatterplot_w_colour(df, colNameX="a", colNameY="b", colNameColor="c")



