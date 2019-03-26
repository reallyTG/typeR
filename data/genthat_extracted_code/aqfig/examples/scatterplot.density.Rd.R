library(aqfig)


### Name: scatterplot.density
### Title: Use color to show the density of points in a scatterplot
### Aliases: scatterplot.density
### Keywords: hplot

### ** Examples

## As a simple test case, build x and y vectors consisting only of the
## integers 1-3.
x <- c( rep(1, 7), rep(2, 12), rep(3, 6) )
y <- c( rep(1, 5), rep(2, 2), rep(1, 2), rep(2, 8), rep(3, 2),
        rep(2, 2), rep(3, 4) )

## For this test case, I've totaled the counts below.
count.df <- data.frame(x=rep(1:3, each=3), y=rep(1:3, times=3), ct=c(5,
2, 0, 2, 8, 2, 0, 2, 4) )

## Make a density scatterplot with counts and percentages.
par(mfrow=c(1,2))
scatterplot.density(x, y, num.bins=3, col=heat.colors(7),
                    density.in.percent=FALSE,
                    col.one.to.one.line="green")
text(count.df$x, count.df$y, count.df$ct, col="purple")
scatterplot.density(x, y, num.bins=3, col=heat.colors(7), col.one.to.one.line=1)
text(count.df$x, count.df$y, count.df$ct/sum(count.df$ct))


## An example closer to actual usage.
x <- rnorm(100000,50,5)
y <- 3 + (.89*x) + rnorm(100000,0,5)
par(mfrow=c(1,1))
scatterplot.density(x, y)



