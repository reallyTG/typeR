library(pracma)


### Name: ppfit
### Title: Piecewise Polynomial Fit
### Aliases: ppfit
### Keywords: fitting

### ** Examples

x <- 0:39
y <- c(  8.8500,  32.0775,  74.7375, 107.6775, 132.0975, 156.6675,
       169.0650, 187.5375, 202.2575, 198.0750, 225.9600, 204.3550,
       233.8125, 204.5925, 232.3625, 204.7550, 220.1925, 199.5875,
       197.3025, 175.3050, 218.6325, 163.0775, 170.6625, 148.2850,
       154.5950, 135.4050, 138.8600, 125.6750, 118.8450,  99.2675,
       129.1675,  91.1925,  89.7000,  76.8825,  83.6625,  74.1950,
        73.9125,  55.8750,  59.8675,  48.1900)

xi <- linspace(0, 39, 8)
pplin <- ppfit(x, y, xi)  # method = "linear"
ppcub <- ppfit(x, y, xi, method = "cubic")

## Not run: 
##D plot(x, y, type = "b", main = "Piecewise polynomial approximation")
##D xs <- linspace(0, 39, 100)
##D yslin <- ppval(pplin, xs)
##D yscub <- ppval(ppcub, xs)
##D lines(xs, yscub, col="red",lwd = 2)
##D lines(xs, yslin, col="blue")
##D grid()
## End(Not run)



