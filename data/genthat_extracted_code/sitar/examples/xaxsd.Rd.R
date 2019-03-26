library(sitar)


### Name: xaxsd
### Title: Par args xaxs and yaxs option d
### Aliases: xaxsd yaxsd yaxsd

### ** Examples


## generate and plot 100 data points
x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch=19)

## generate and plot 10 more
## constraining axis scales to be as before
x <- rnorm(10)
y <- rnorm(10)
plot(x, y, pch=19, xlim=xaxsd(), ylim=yaxsd())

## force axis extremes to be -3 and 3
plot(x, y, pch=19, xlim=xaxsd(c(-3,3)), ylim=yaxsd(c(-3,3)))




