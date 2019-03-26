library(hexbin)


### Name: hexbin
### Title: Bivariate Binning into Hexagon Cells
### Aliases: hexbin hexbin-class 'integer or NULL-class' show,hexbin-method
###   summary,hexbin-method
### Keywords: dplot

### ** Examples

set.seed(101)
x <- rnorm(10000)
y <- rnorm(10000)
(bin <- hexbin(x, y))
## or
plot(hexbin(x, y + x*(x+1)/4),
     main = "(X, X(X+1)/4 + Y)  where X,Y ~ rnorm(10000)")

## Using plot method for hexbin objects:
plot(bin, style = "nested.lattice")

hbi <- hexbin(y ~ x, xbins = 80, IDs= TRUE)
str(hbi)
tI <- table(hbi@cID)
stopifnot(names(tI) == hbi@cell,
                tI  == hbi@count)

## NA's now work too:
x[runif(6, 0, length(x))] <- NA
y[runif(7, 0, length(y))] <- NA
hbN <- hexbin(x,y)
summary(hbN)



