library(GSE)


### Name: gy.filt
### Title: Gervini-Yohai filter for detecting cellwise outliers
### Aliases: gy.filt

### ** Examples

set.seed(12345)

# Generate 5% cell-wise contaminated normal data 
x <- generate.cellcontam(n=100, p=10, cond=100, contam.size=5, contam.prop=0.05)$x

## Using univariate filter only
xna <- gy.filt(x, alpha=c(0.95,0))
mean(is.na(xna))

## Using univariate-and-bivariate filter
xna <- gy.filt(x, alpha=c(0.95,0.95))
mean(is.na(xna))



