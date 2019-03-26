library(polyCub)


### Name: polyCub
### Title: Wrapper Function for the Various Cubature Methods
### Aliases: polyCub
### Keywords: math spatial

### ** Examples

## a function to integrate (here: isotropic zero-mean Gaussian density)
f <- function (s, sigma = 5)
    exp(-rowSums(s^2)/2/sigma^2) / (2*pi*sigma^2)

## a simple polygon as integration domain
hexagon <- list(
    list(x = c(7.33, 7.33, 3, -1.33, -1.33, 3),
         y = c(-0.5, 4.5, 7, 4.5, -0.5, -3))
)

## image of the function and integration domain
plotpolyf(hexagon, f, xlim = c(-8,8), ylim = c(-8,8))


### 1. Product Gauss cubature

## use a degree of nGQ = 3 and show the corresponding nodes
polyCub.SV(hexagon, f, nGQ = 3, plot = TRUE)

## extract nodes and weights
nw <- polyCub.SV(hexagon, f = NULL, nGQ = 3)[[1]]
nrow(nw$nodes)

## manually apply the cubature rule
sum(nw$weights * f(nw$nodes))

## use an increasing number of nodes
for (nGQ in c(1:5, 10, 20, 60))
    cat(sprintf("nGQ = %2i: %.16f\n", nGQ,
                polyCub.SV(hexagon, f, nGQ = nGQ)))

## polyCub.SV() is the default method used by the polyCub() wrapper
polyCub(hexagon, f, nGQ = 3)  # calls polyCub.SV()


### 2. Two-dimensional midpoint rule

if (require("spatstat")) {
    hexagon.owin <- owin(poly = hexagon)

    show_midpoint <- function (eps)
    {
        plotpolyf(hexagon.owin, f, xlim = c(-8,8), ylim = c(-8,8),
                  use.lattice = FALSE)
        ## add evaluation points to plot
        with(as.mask(hexagon.owin, eps = eps),
             points(expand.grid(xcol, yrow), col = t(m), pch = 20))
        title(main = paste("2D midpoint rule with eps =", eps))
    }

    ## show nodes (eps = 0.5)
    show_midpoint(0.5)

    ## show pixel image (eps = 0.5)
    polyCub.midpoint(hexagon.owin, f, eps = 0.5, plot = TRUE)

    ## use a decreasing pixel size (increasing number of nodes)
    for (eps in c(5, 3, 1, 0.5, 0.3, 0.1))
        cat(sprintf("eps = %.1f: %.7f\n", eps,
                    polyCub.midpoint(hexagon.owin, f, eps = eps)))
}


### 3. Adaptive cubature for *isotropic* functions

polyCub.iso(hexagon, f, center = c(0,0))
## see ?polyCub.iso and the examples therein


### 4. Quasi-exact cubature of the bivariate Gaussian density
###    based on gpclib::tristrip and mvtnorm::pmvnorm()

if (requireNamespace("mvtnorm") && gpclibPermit()) {
    hexagon.gpc <- new("gpc.poly", pts = lapply(hexagon, c, list(hole = FALSE)))
    print(polyCub.exact.Gauss(hexagon.gpc, mean = c(0,0), Sigma = 5^2*diag(2),
                              plot = TRUE), digits = 16)
}



### now using a simple *rectangular* integration domain

rectangle <- list(list(x = c(-1, 7, 7, -1), y = c(-3, -3, 7, 7)))

## polyCub.SV 'rotation' (may improve accuracy)
opar <- par(mfrow = c(1,3))
polyCub.SV(rectangle, f, nGQ = 4, rotation = FALSE, plot = TRUE)
           title(main = "without rotation")
polyCub.SV(rectangle, f, nGQ = 4, rotation = TRUE,  plot = TRUE)
           title(main = "default rotation")
polyCub.SV(rectangle, f, nGQ = 4,
           rotation = list(P = c(0,0), Q = c(2,-3)), plot = TRUE)
           title(main = "custom rotation")
par(opar)

## comparison with cubature::adaptIntegrate()
if (require("cubature")) {
    fc <- function (s, sigma = 5)
        exp(-sum(s^2)/2/sigma^2) / (2*pi*sigma^2)
    adaptIntegrate(f = fc, lowerLimit = c(-1, -3), upperLimit = c(7, 7))
}



