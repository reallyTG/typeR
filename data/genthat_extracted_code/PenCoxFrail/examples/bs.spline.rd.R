library(PenCoxFrail)


### Name: bs.design
### Title: Generate a B-spline design matrix
### Aliases: bs.design

### ** Examples

x <- rnorm(100)
B <- bs.design(x=x, xl=min(x), xr=max(x), spline.degree=3, nbasis=5)



