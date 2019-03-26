library(pracma)


### Name: lsqnonlin
### Title: Nonlinear Least-Squares Fitting
### Aliases: lsqnonlin lsqnonneg lsqcurvefit lsqsep
### Keywords: fitting

### ** Examples

##  Rosenberg function as least-squares problem
x0  <- c(0, 0)
fun <- function(x) c(10*(x[2]-x[1]^2), 1-x[1])
lsqnonlin(fun, x0)

##  Example from R-help
y <- c(5.5199668,  1.5234525,  3.3557000,  6.7211704,  7.4237955,  1.9703127,
       4.3939336, -1.4380091,  3.2650180,  3.5760906,  0.2947972,  1.0569417)
x <- c(1,   0,   0,   4,   3,   5,  12,  10,  12, 100, 100, 100)
# Define target function as difference
f <- function(b)
     b[1] * (exp((b[2] - x)/b[3]) * (1/b[3]))/(1 + exp((b[2] - x)/b[3]))^2 - y
x0 <- c(21.16322, 8.83669, 2.957765)
lsqnonlin(f, x0)        # ssq 50.50144 at c(36.133144, 2.572373, 1.079811)

# nls() will break down
# nls(Y ~ a*(exp((b-X)/c)*(1/c))/(1 + exp((b-X)/c))^2,
#     start=list(a=21.16322, b=8.83669, c=2.957765), algorithm = "plinear")
# Error: step factor 0.000488281 reduced below 'minFactor' of 0.000976563

##  Example: Hougon function
x1 <- c(470, 285, 470, 470, 470, 100, 100, 470, 100, 100, 100, 285, 285)
x2 <- c(300,  80, 300,  80,  80, 190,  80, 190, 300, 300,  80, 300, 190)
x3 <- c( 10,  10, 120, 120,  10,  10,  65,  65,  54, 120, 120,  10, 120)
rate <- c(8.55,  3.79, 4.82, 0.02,  2.75, 14.39, 2.54,
          4.35, 13.00, 8.50, 0.05, 11.32,  3.13)
fun <- function(b)
        (b[1]*x2 - x3/b[5])/(1 + b[2]*x1 + b[3]*x2 + b[4]*x3) - rate
lsqnonlin(fun, rep(1, 5))
# $x    [1.25258502 0.06277577 0.04004772 0.11241472 1.19137819]
# $ssq  0.298901

##  Example for lsqnonneg()
C1 <- matrix( c(0.1210, 0.2319, 0.4398, 0.9342, 0.1370,
                0.4508, 0.2393, 0.3400, 0.2644, 0.8188,
                0.7159, 0.0498, 0.3142, 0.1603, 0.4302,
                0.8928, 0.0784, 0.3651, 0.8729, 0.8903,
                0.2731, 0.6408, 0.3932, 0.2379, 0.7349,
                0.2548, 0.1909, 0.5915, 0.6458, 0.6873,
                0.8656, 0.8439, 0.1197, 0.9669, 0.3461,
                0.2324, 0.1739, 0.0381, 0.6649, 0.1660,
                0.8049, 0.1708, 0.4586, 0.8704, 0.1556,
                0.9084, 0.9943, 0.8699, 0.0099, 0.1911), ncol = 5, byrow = TRUE)
C2 <- C1 - 0.5
d <- c(0.4225, 0.8560, 0.4902, 0.8159, 0.4608,
       0.4574, 0.4507, 0.4122, 0.9016, 0.0056)
( sol <- lsqnonneg(C1, d) )     #-> resid.norm   0.3694372
( sol <- lsqnonneg(C2, d) )     #-> $resid.norm  2.863979

##  Example for lsqcurvefit()
#   Lanczos1 data (artificial data)
#   f(x) = 0.0951*exp(-x) + 0.8607*exp(-3*x) + 1.5576*exp(-5*x)
x <- linspace(0, 1.15, 24)
y <- c(2.51340000, 2.04433337, 1.66840444, 1.36641802, 1.12323249, 0.92688972,
       0.76793386, 0.63887755, 0.53378353, 0.44793636, 0.37758479, 0.31973932,
       0.27201308, 0.23249655, 0.19965895, 0.17227041, 0.14934057, 0.13007002,
       0.11381193, 0.10004156, 0.08833209, 0.07833544, 0.06976694, 0.06239313)

p0 <- c(1.2, 0.3, 5.6, 5.5, 6.5, 7.6)
fp <- function(p, x) p[1]*exp(-p[2]*x) + p[3]*exp(-p[4]*x) + p[5]*exp(-p[6]*x)
lsqcurvefit(fp, p0, x, y)

##  Example for lsqsep()
f <- function(x) 0.5 + x^-0.5 + exp(-0.5*x)
set.seed(8237); n <- 15
x <- sort(0.5 + 9*runif(n))
y <- f(x)                       #y <- f(x) + 0.01*rnorm(n)

m <- 2
f1 <- function(b, x) x^b
f2 <- function(b, x) exp(b*x)
flist <- list(f1, f2)
start <- c(-0.25, -0.75)

sol <- lsqsep(flist, start, x, y, const = TRUE)
a0 <- sol$a0; a <- sol$a; b <- sol$b
fsol <- function(x) a0 + a[1]*f1(b[1], x) + a[2]*f2(b[2], x)

## Not run: 
##D     ezplot(f, 0.5, 9.5, col = "gray")
##D     points(x, y, col = "blue")
##D     xs <- linspace(0.5, 9.5, 51)
##D     ys <- fsol(xs)
##D     lines(xs, ys, col = "red")
## End(Not run)



