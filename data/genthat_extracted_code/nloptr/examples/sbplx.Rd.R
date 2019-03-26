library(nloptr)


### Name: sbplx
### Title: Subplex Algorithm
### Aliases: sbplx

### ** Examples


# Fletcher and Powell's helic valley
fphv <- function(x)
    100*(x[3] - 10*atan2(x[2], x[1])/(2*pi))^2 +
        (sqrt(x[1]^2 + x[2]^2) - 1)^2 +x[3]^2
x0 <- c(-1, 0, 0)
sbplx(x0, fphv)    #  1 0 0

# Powell's Singular Function (PSF)
psf <- function(x)  (x[1] + 10*x[2])^2 + 5*(x[3] - x[4])^2 +
                    (x[2] - 2*x[3])^4 + 10*(x[1] - x[4])^4
x0 <- c(3, -1, 0, 1)
sbplx(x0, psf, control = list(maxeval = Inf, ftol_rel = 1e-6))  #  0 0 0 0 (?)




