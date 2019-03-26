library(qtlcharts)


### Name: iplot
### Title: Interactive scatterplot
### Aliases: iplot
### Keywords: hplot

### ** Examples

x <- rnorm(100)
grp <- sample(1:3, 100, replace=TRUE)
y <- x*grp + rnorm(100)
## No test: 
iplot(x, y, grp)
## End(No test)




