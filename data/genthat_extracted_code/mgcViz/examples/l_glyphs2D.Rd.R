library(mgcViz)


### Name: l_glyphs2D
### Title: Adding glyphs to 2D plots
### Aliases: l_glyphs2D

### ** Examples

library(mgcViz);
set.seed(4124)
n <- 1e4
dat <- data.frame("x1" = rnorm(n), "x2" = rnorm(n))

# Residuals are heteroscedastic w.r.t. x1
dat$y <- (dat$x1)^2 + (dat$x2)^2 + (1*abs(dat$x1) + 1)  * rnorm(n)
b <- bam(y ~ s(x1,k=30) + s(x2, k=30), data = dat, discrete = TRUE)
b <- getViz(b)

pl <- check2D(b, x1 = "x1", x2 = "x2", type = "tnormal") + 
  l_points(colour = "blue", alpha = 0.5)

# Look at distributions of residuals across x1 and x2
# Approach 1: using binned kernel density estimate
# Colour indicates whether we have more that 50 obs in that bin
glyFun <- function(.d){
  .r <- .d$z
  .qq <- as.data.frame( density(.r)[c("x", "y")], n = 100 )
  .qq$colour <- rep(ifelse(length(.r)>50, "black", "red"), nrow(.qq))
  return( .qq )
}

pl + l_glyphs2D(glyFun = glyFun, ggLay = "geom_path", n = c(8, 8),
                 mapping = aes(x=gx, y=gy, group = gid, colour = I(colour)), 
                 height=1.5, width = 1) 

# Approach 2: using binned worm-plots. These are simply rotated QQplots.
# An horizontal plot indicates well specified residual model. 
# Increasing (decreasing) worm indicates over (under) dispersion
glyFun <- function(.d){
  n <- nrow(.d)
  px <- qnorm( (1:n - 0.5)/(n) )
  py <- sort( .d$z )
  clr <- if(n > 50) { "black" } else { "red" }
  clr <- rep(clr, n)
  return( data.frame("x" = px, "y" = py - px, "colour" = clr))
}

pl + l_glyphs2D(glyFun = glyFun, ggLay = "geom_point", n = c(10, 10),
                mapping = aes(x=gx, y=gy, group = gid, colour = I(colour)),
                height=2, width = 1, size = 0.2) 




