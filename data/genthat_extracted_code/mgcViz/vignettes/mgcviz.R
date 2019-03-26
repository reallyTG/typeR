## ----setup, include=FALSE------------------------------------------------
library(knitr)
library(rgl)
opts_chunk$set(out.extra='style="display:block; margin: auto"', fig.align="center", tidy=FALSE)
knit_hooks$set(webgl = hook_webgl)

## ----1, message = F------------------------------------------------------
library(mgcViz)
n  <- 1e3
dat <- data.frame("x1" = rnorm(n), "x2" = rnorm(n), "x3" = rnorm(n))
dat$y <- with(dat, sin(x1) + 0.5*x2^2 + 0.2*x3 + pmax(x2, 0.2) * rnorm(n))
b <- gam(y ~ s(x1) + s(x2) + x3, data = dat, method = "REML")

## ----2-------------------------------------------------------------------
b <- getViz(b)

## ----3-------------------------------------------------------------------
o <- plot( sm(b, 1) )
o + l_fitLine(colour = "red") + l_rug(mapping = aes(x=x, y=y), alpha = 0.8) +
    l_ciLine(mul = 5, colour = "blue", linetype = 2) + 
    l_points(shape = 19, size = 1, alpha = 0.1) + theme_classic()

## ----5-------------------------------------------------------------------
listLayers(o)

## ----6-------------------------------------------------------------------
b <- gam(y ~ s(x1, x2) + x3, data = dat, method = "REML")
b <- getViz(b)

## ----7-------------------------------------------------------------------
plot(sm(b, 1)) + l_fitRaster() + l_fitContour() + l_points()

## ----8a, message = F, warning = F, fig.width=10, fig.height=4------------
gridPrint(plot(sm(b, 1)) + l_fitRaster() + l_fitContour() + labs(title = NULL) + guides(fill=FALSE),
          plot(pterm(b, 1)) + l_ciPoly() + l_fitLine(), ncol = 2)

## ----9-------------------------------------------------------------------
b <- getGam(b)
class(b)

## ----10, results='hide'--------------------------------------------------
dat <- gamSim(1,n=1e3,dist="normal",scale=2)
dat$fac <- as.factor( sample(letters[1:6], nrow(dat), replace = TRUE) )
b <- gam(y~s(x0)+s(x1, x2)+s(x3)+fac, data=dat)

## ----11------------------------------------------------------------------
b <- getViz(b)
print(plot(b, allTerms = T), pages = 1) # Calls print.plotGam()

## ----11a, eval = FALSE---------------------------------------------------
#  plot(b)

## ----13------------------------------------------------------------------
pl <- plot(b, allTerms = T) + l_points() + l_fitLine(linetype = 3) + l_fitContour() + 
      l_ciLine(colour = 2) + l_ciBar() + l_fitPoints(size = 1, col = 2) + theme_get() + labs(title = NULL)
pl$empty # FALSE: because we added gamLayers
print(pl, pages = 1)

## ----14------------------------------------------------------------------
plot(b, select = 1)

## ----15------------------------------------------------------------------
plot(b, select = 1) + l_dens(type = "cond") + l_fitLine() + l_ciLine()

## ----15a-----------------------------------------------------------------
plot(b, allTerms = TRUE, select = 4) + geom_hline(yintercept = 0)

## ----16, warning = F, webgl=TRUE-----------------------------------------
library(mgcViz)
n <- 500
x <- rnorm(n); y <- rnorm(n); z <- rnorm(n)
ob <- (x-z)^2 + (y-z)^2 + rnorm(n)
b <- gam(ob ~ s(x, y, z))
b <- getViz(b)

plotRGL(sm(b, 1), fix = c("z" = 0), residuals = TRUE)

## ----17------------------------------------------------------------------
aspect3d(1, 2, 1)

## ----19, results='hide'--------------------------------------------------
set.seed(0)
n.samp <- 400
dat <- gamSim(1,n = n.samp, dist = "binary", scale = .33)
p <- binomial()$linkinv(dat$f) ## binomial p
n <- sample(c(1, 3), n.samp, replace = TRUE) ## binomial n
dat$y <- rbinom(n, n, p)
dat$n <- n
lr.fit <- gam(y/n ~ s(x0) + s(x1) + s(x2) + s(x3), 
              family = binomial, data = dat,
              weights = n, method = "REML")
lr.fit <- getViz(lr.fit)

## ----20------------------------------------------------------------------
qq(lr.fit, method = "simul1", a.qqpoi = list("shape" = 1), a.ablin = list("linetype" = 2))

## ----21------------------------------------------------------------------
qq(lr.fit, rep = 20, showReps = T, CI = "none", a.qqpoi = list("shape" = 19), a.replin = list("alpha" = 0.2))

## ----22, results='hide'--------------------------------------------------
set.seed(0)
n.samp <- 50000
dat <- gamSim(1,n=n.samp,dist="binary",scale=.33)
p <- binomial()$linkinv(dat$f) ## binomial p
n <- sample(c(1,3),n.samp,replace=TRUE) ## binomial n
dat$y <- rbinom(n,n,p)
dat$n <- n
lr.fit <- bam(y/n ~ s(x0) + s(x1) + s(x2) + s(x3)
              , family = binomial, data = dat,
              weights = n, method = "fREML", discrete = TRUE)
lr.fit <- getViz(lr.fit)

## ----23------------------------------------------------------------------
o <- qq(lr.fit, rep = 10, method = "simul1", CI = "normal", showReps = TRUE, 
        a.replin = list(alpha = 0.1), discrete = TRUE)
o 

## ----24------------------------------------------------------------------
o <- qq(lr.fit, rep = 10, method = "simul1", CI = "normal", showReps = TRUE,
        ngr = 1e2, a.replin = list(alpha = 0.1), a.qqpoi = list(shape = 19))
o 

## ----24a-----------------------------------------------------------------
gridPrint(o, zoom(o, xlim = c(2, 2.5), ylim = c(2, 2.5)), ncol = 2)

## ----24b, eval = FALSE---------------------------------------------------
#  # Cannot run this when building the pdf for this vignette, but do try it!
#  shine(o)

## ----25------------------------------------------------------------------
set.seed(0)
dat <- gamSim(1, n = 200)
b <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
b <- getViz(b)

check(b,
      a.qq = list(method = "tnorm", 
                  a.cipoly = list(fill = "light blue")), 
      a.respoi = list(size = 0.5), 
      a.hist = list(bins = 10))

## ----26------------------------------------------------------------------
set.seed(4124)
n <- 1e4
x <- rnorm(n); y <- rnorm(n);
z <- as.factor( sample(letters[1:6], n, replace = TRUE) )

ob <- (x)^2 + (y)^2 + (0.2*abs(x) + 1)  * rnorm(n)
b <- bam(ob ~ s(x,k=30) + s(y, k=30) + z, discrete = TRUE)
b <- getViz(b)

## ----27, fig.width=6, fig.height=3---------------------------------------
ck1 <- check1D(b, "x")
ck2 <- check1D(b, "z")
gridPrint(ck1, ck2, ncol = 2)

## ----28, fig.width=10, fig.height=4--------------------------------------
gridPrint(ck1 + l_dens(type = "cond", alpha = 0.8) + l_rug(alpha = 0.2), 
          ck2 + l_points() + l_rug(alpha = 0.2), layout_matrix = matrix(c(1, 1, 1, 2, 2), 1, 5))

## ----29------------------------------------------------------------------
ck1 + l_densCheck()

## ----30, fig.width=10, fig.height=4--------------------------------------
b <- getViz(b, nsim = 50)
gridPrint(check1D(b, "x") + l_gridCheck1D(gridFun = sd, showReps = TRUE), 
          check1D(b, "z") + l_gridCheck1D(gridFun = sd, showReps = TRUE), ncol = 2)

## ----31------------------------------------------------------------------
set.seed(566)
n <- 1e4
X <- data.frame("x1"=rnorm(n, 0.5, 0.5), "x2"=rnorm(n, 1.5, 1), 
                "fac"=as.factor( sample(letters[1:6], n, replace = TRUE) ))
X$y <- (1-X$x1)^2 + 100*(X$x2 - X$x1^2)^2 + rnorm(n, 0, 2)
b <- bam(y ~ te(x1, x2, k = 5), data = X, discrete = TRUE)
b <- getViz(b, nsim = 50)

## ----32------------------------------------------------------------------
ck1 <- check2D(b, x1 = "x1", x2 = "x2")
ck2 <- check2D(b, x1 = X$fac, x2 = "x2") + labs(x = "fac")

## ----33------------------------------------------------------------------
ck1 + l_gridCheck2D(gridFun = mean)
ck2 + l_gridCheck2D(gridFun = mean)

## ----34------------------------------------------------------------------
ck1 + l_gridCheck2D(bw = c(0.05, 0.1)) + xlim(-1, 1) + ylim(0, 3)

## ----35------------------------------------------------------------------
listLayers( ck1 ) 

## ----36------------------------------------------------------------------
set.seed(4124)
n <- 1e4
dat <- data.frame("x1" = rnorm(n), "x2" = rnorm(n))
dat$y <- (dat$x1)^2 + (dat$x2)^2 + (1*abs(dat$x1) + 1)  * rnorm(n)
b <- bam(y ~ s(x1,k=30) + s(x2, k=30), data = dat, discrete = TRUE)
b <- getViz(b)

ck <- check2D(b, x1 = "x1", x2 = "x2", type = "tnormal")

## ----37------------------------------------------------------------------
glyFun <- function(.d){
  .r <- .d$z
  .qq <- as.data.frame( density(.r)[c("x", "y")], n = 100 )
  .qq$colour <- rep(ifelse(length(.r)>50, "black", "red"), nrow(.qq))
  return( .qq )
}

ck + l_glyphs2D(glyFun = glyFun, ggLay = "geom_path", n = c(8, 8),
                mapping = aes(x=gx, y=gy, group = gid, colour = I(colour)), 
                height=1.5, width = 1)

## ----38------------------------------------------------------------------
glyFun <- function(.d){
  n <- nrow(.d)
  px <- qnorm( (1:n - 0.5)/(n) )
  py <- sort( .d$z )
  clr <- if(n > 50) { "black" } else { "red" }
  clr <- rep(clr, n)
  return( data.frame("x" = px, "y" = py - px, "colour" = clr))
}

ck + l_glyphs2D(glyFun = glyFun, ggLay = "geom_point", n = c(10, 10),
                mapping = aes(x=gx, y=gy, group = gid, colour = I(colour)),
                height=2, width = 1, size = 0.2) 

## ----39, results='hide'--------------------------------------------------
set.seed(6898)
dat <- gamSim(1,n=1500,dist="normal",scale=20)
dat$fac <- as.factor( sample(c("A1", "A2", "A3"), nrow(dat), replace = TRUE) ) 
bs <- "cr"; k <- 12
b <- gam(y ~ s(x2,bs=bs,by = fac), data=dat)
b <- getViz(b)

## ----39a-----------------------------------------------------------------
plotDiff(s1 = sm(b, 1), s2 = sm(b, 2)) + l_ciPoly() + 
         l_fitLine() + geom_hline(yintercept = 0, linetype = 2)

## ----40------------------------------------------------------------------
n <- 5e3
x <- rnorm(n); y <- rnorm(n); z <- rnorm(n); z2 <- rnorm(n)
ob <- (x-z)^2 + (y-z)^2 + z2^3 + rnorm(n)
b <- bam(ob ~ s(x, y, z, z2), discrete = TRUE)
v <- getViz(b)

# Plot slices across "z" and "x"
pl <- plotSlice(x = sm(v, 1), 
                fix = list("z" = seq(-2, 2, length.out = 3), "x" = c(-1, 0, 1)))
pl + l_fitRaster() + l_fitContour() + l_points() + l_rug()

