## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.align = "center", 
               out.width = "70%",
               fig.width = 5, fig.height = 4,
               dev.args=list(pointsize=10),
               par = TRUE, # needed for setting hook 
               collapse = TRUE, # collapse input & ouput code in chunks
               warning = FALSE)
knit_hooks$set(par = function(before, options, envir)
  { if(before && options$fig.show != "none") 
       par(mar=c(4.1,4.1,1.1,1.1), mgp=c(3,1,0), tcl=-0.5)
})

library(rgl)
# setupKnitr()
# knit_hooks$set(rgl = hook_webgl)

set.seed(1) # for exact reproducibility

## ------------------------------------------------------------------------
library(msir)

## ------------------------------------------------------------------------
n <- 200
p <- 5
b <- as.matrix(c(1,-1,rep(0,p-2)))
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- exp(0.5 * x%*%b) + 0.1*rnorm(n)
MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, type = "evalues")
plot(MSIR, type = "coefficients", which = 1)
plot(MSIR, type = "2Dplot")

## ------------------------------------------------------------------------
n <- 200
p <- 5
b <- as.matrix(c(1,-1,rep(0,p-2)))
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- (0.5 * x%*%b)^2 + 0.1*rnorm(n)
MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, type = "evalues")
plot(MSIR, type = "coefficients", which = 1)
plot(MSIR, type = "2Dplot")

## ------------------------------------------------------------------------
n <- 300
p <- 5
b1 <- c(1, 1, 1, rep(0, p-3))
b2 <- c(1,-1,-1, rep(0, p-3))
b <- cbind(b1,b2)
x <- matrix(rnorm(n*p), nrow = n, ncol = p)
y <- x %*% b1 + (x %*% b1)^3 + 4*(x %*% b2)^2 + rnorm(n)
MSIR <- msir(x, y)
summary(MSIR)
plot(MSIR, type = "evalues")
plot(MSIR, type = "coefficients", which = 1:2)
plot(MSIR, which = 1:2)
plot(MSIR, which = 1, type = "2Dplot", span = 0.7)
plot(MSIR, which = 2, type = "2Dplot", span = 0.7)

## ---- echo=1, fig.width = 4, fig.height = 4------------------------------
plot(MSIR, type = "spinplot")
rglwidget(width=500, height=450)

## ---- echo=1, fig.width = 4, fig.height = 4------------------------------
plot(MSIR, type = "spinplot", span = 0.75)
rglwidget(width=500, height=450)

## ------------------------------------------------------------------------
x1 <- rnorm(100)
x2 <- rnorm(100)
y  <- 2*x1 + x2^2 + 0.5*rnorm(100)

## ---- echo=1-------------------------------------------------------------
spinplot(x1, y, x2)
rglwidget(width=500, height=450)

## ---- echo=1-------------------------------------------------------------
spinplot(x1, y, x2, scaling="aaa")
rglwidget(width=500, height=450)

## ---- echo=1-------------------------------------------------------------
spinplot(x1, y, x2, rem.lin.trend = "TRUE")
rglwidget(width=500, height=450)

## ---- echo=1-------------------------------------------------------------
spinplot(x1, y, x2, fit.smooth = TRUE)
rglwidget(width=500, height=450)

## ---- echo=1-------------------------------------------------------------
spinplot(x1, y, x2, fit.ols = TRUE)
rglwidget(width=500, height=450)

## ------------------------------------------------------------------------
x <- iris[,1:3]
y <- iris[,5]

## ---- echo=1-------------------------------------------------------------
spinplot(x)
rglwidget(width=500, height=450)

## ---- echo=1-------------------------------------------------------------
spinplot(x, markby = y)
rglwidget(width=500, height=450)

## ---- echo=1-------------------------------------------------------------
spinplot(x, markby = y, pch = c(0,3,1), 
         col.points = c("lightcyan", "yellow", "lightgreen"), 
         background = "black")
rglwidget(width=500, height=450)

## ---- echo=-1-------------------------------------------------------------------------------------
options(width=100)
sessionInfo()

