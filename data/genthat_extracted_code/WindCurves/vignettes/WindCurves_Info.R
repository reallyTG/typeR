## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.show='hold', fig.height=5, fig.width=7-------------------------
library(WindCurves)
data(pcurves)
s <- pcurves$Speed
p <- pcurves$`Nordex N90`
da <- data.frame(s,p)
x <- fitcurve(da)
x
validate.curve(x)
plot(x)

## ---- fig.show='hold', fig.height=5, fig.width=7-------------------------
random <- function(x)
{
  data_y <- sort(sample(1:1500, size = 25, replace = TRUE))
  d <- data.frame(data_y)
  return(d)
}
dump("random")
rm(random)

## ---- fig.show='hold', fig.height=5, fig.width=7-------------------------
library(WindCurves)
data(pcurves)
s <- pcurves$Speed
p <- pcurves$`Nordex N90`
da <- data.frame(s,p)
x <- fitcurve(data = da, MethodPath = "source('dumpdata.R')", MethodName = "Random values")

## The user can specify .R files from other locations as:
# x <- fitcurve(data = da, MethodPath = "source('~/WindCurves/R/random.R')", MethodName = "Random values")
validate.curve(x)
plot(x)

## ---- fig.show='hold', fig.height=5, fig.width=7-------------------------
# PCV as an error metric
error <- function(a,b)
{
d <- (var(a) - var(b)) * 100/ var(a)
d <- as.numeric(d)
return(d)
}
dump("error")
rm(error)

## ---- fig.show='hold', fig.height=5, fig.width=7-------------------------
library(WindCurves)
data(pcurves)
s <- pcurves$Speed
p <- pcurves$`Nordex N90`
da <- data.frame(s,p)
x <- fitcurve(da)
validate.curve(x = x, MethodPath = "source('dumpdata.R')", MethodName = "New Error")
plot(x)

## ---- fig.show='hold', fig.height=5, fig.width=9-------------------------
data(pcurves)
pcurves

## ---- fig.show='hold', fig.height=5, fig.width=7-------------------------
#img2points("image.jpeg")

