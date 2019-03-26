library(polyCub)


### Name: plotpolyf
### Title: Plot Polygonal Domain on Image of Bivariate Function
### Aliases: plotpolyf
### Keywords: hplot

### ** Examples

### a polygonal domain (a rounded version of spatstat.data::letterR$bdry)
letterR <- list(
    list(x = c(3.9, 3.8, 3.7, 3.5, 3.4, 3.5, 3.7, 3.8, 3.8, 3.7,
               3.7, 3.5, 3.3, 2, 2, 2.7, 2.7, 2.9, 3, 3.3, 3.9),
         y = c(0.7, 1.1, 1.3, 1.7, 1.8, 1.9, 2.1, 2.3, 2.5, 2.8, 3,
               3.2, 3.3, 3.3, 0.7, 0.7, 1.7, 1.7, 1.5, 0.7, 0.6)),
    list(x = c(2.6, 2.6, 3, 3.1, 3.2, 3.1, 3.1, 3),
         y = c(2.2, 2.7, 2.7, 2.6, 2.5, 2.4, 2.3, 2.2))
)

### f: isotropic exponential decay
fr <- function(r, rate = 1) dexp(r, rate = rate)
fcenter <- c(2,3)
f <- function (s, rate = 1) fr(sqrt(rowSums(t(t(s)-fcenter)^2)), rate = rate)

### plot
plotpolyf(letterR, f, use.lattice = FALSE)
plotpolyf(letterR, f, use.lattice = TRUE)



