library(broman)


### Name: grayplot_na
### Title: Scatterplot with missing values indicated
### Aliases: grayplot_na
### Keywords: graphics

### ** Examples

## Don't show: 
set.seed(97536917)
## End(Don't show)
n <- 100
x <- rnorm(n)
y <- x+rnorm(n, 0, 0.7)
x[sample(n, 10)] <- NA

grayplot_na(x, y)

grayplot_na(x, y, force="y")

y[sample(n, 10)] <- NA
grayplot_na(x, y)




