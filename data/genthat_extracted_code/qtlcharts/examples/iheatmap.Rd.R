library(qtlcharts)


### Name: iheatmap
### Title: Interactive heat map
### Aliases: iheatmap
### Keywords: hplot

### ** Examples

n <- 101
x <- y <- seq(-2, 2, len=n)
z <- matrix(ncol=n, nrow=n)
for(i in seq(along=x))
    for(j in seq(along=y))
        z[i,j] <- x[i]*y[j]*exp(-x[i]^2 - y[j]^2)
## No test: 
iheatmap(z, x, y)
## End(No test)




