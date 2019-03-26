library(misc3d)


### Name: image3d
### Title: Draw Points on a 3D Grid
### Aliases: image3d
### Keywords: hplot

### ** Examples

    # view density of mixture of tri-variate normals
    nmix3 <- function(x, y, z, m, s) {
      0.4 * dnorm(x, m, s) * dnorm(y, m, s) * dnorm(z, m, s) +
        0.3 * dnorm(x, -m, s) * dnorm(y, -m, s) * dnorm(z, -m, s) +
          0.3 * dnorm(x, m, s) * dnorm(y, -1.5 * m, s) * dnorm(z, m, s)
    }
    f <- function(x,y,z) nmix3(x,y,z,.5,.5)
    x<-seq(-2,2,len=50)
    g <- expand.grid(x = x, y = x, z = x)
    v <- array(f(g$x, g$y, g$z), c(length(x), length(x), length(x)))
    image3d(v)
    image3d(v, jitter = TRUE)



