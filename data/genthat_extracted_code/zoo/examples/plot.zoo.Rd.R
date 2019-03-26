library(zoo)


### Name: plot.zoo
### Title: Plotting zoo Objects
### Aliases: plot.zoo barplot.zoo lines.zoo points.zoo
### Keywords: ts

### ** Examples

## example dates
x.Date <- as.Date(paste(2003, 02, c(1, 3, 7, 9, 14), sep = "-"))

## univariate plotting
x <- zoo(rnorm(5), x.Date)
x2 <- zoo(rnorm(5, sd = 0.2), x.Date)
plot(x)
lines(x2, col = 2)

## multivariate plotting
z <- cbind(x, x2, zoo(rnorm(5, sd = 0.5), x.Date))
plot(z, type = "b", pch = 1:3, col = 1:3, ylab = list(expression(mu), "b", "c"))
colnames(z) <- LETTERS[1:3]
plot(z, screens = 1, col = list(B = 2))
plot(z, type = "b", pch = 1:3, col = 1:3)
plot(z, type = "b", pch = list(A = 1:5, B = 3), col = list(C = 4, 2))
plot(z, type = "b", screen = c(1,2,1), col = 1:3)
# right axis is for broken lines
plot(x)
opar <- par(usr = c(par("usr")[1:2], range(x2)))
lines(x2, lty = 2)
# axis(4)
axis(side = 4)
par(opar)


## Custom x axis labelling using a custom panel.
# 1. test data
z <- zoo(c(21, 34, 33, 41, 39, 38, 37, 28, 33, 40), 
     as.Date(c("1992-01-10", "1992-01-17", "1992-01-24", "1992-01-31", 
       "1992-02-07", "1992-02-14", "1992-02-21", "1992-02-28", "1992-03-06", 
       "1992-03-13")))
zz <- merge(a = z, b = z+10)
# 2. axis tick for every point. Also every 3rd point labelled.
my.panel <- function(x, y, ..., pf = parent.frame()) {
   fmt <- "%b-%d" # format for axis labels
   lines(x, y, ...)
   # if bottom panel
   if (with(pf, length(panel.number) == 0 || 
        panel.number %% nr == 0 || panel.number == nser)) { 
      # create ticks at x values and then label every third tick
      axis(side = 1, at = x, labels = FALSE)
      ix <- seq(1, length(x), 3)
      labs <- format(x, fmt)
      axis(side = 1, at = x[ix], labels = labs[ix], tcl = -0.7, cex.axis = 0.7)
   }
}
# 3. plot
plot(zz, panel = my.panel, xaxt = "n")

# with a single panel plot a fancy x-axis is just the same
# procedure as for the ordinary plot command
plot(zz, screen = 1, col = 1:2, xaxt = "n")
# axis(1, at = time(zz), labels = FALSE)
tt <- time(zz)
axis(side = 1, at = tt, labels = FALSE)
ix <- seq(1, length(tt), 3)
fmt <- "%b-%d" # format for axis labels
labs <- format(tt, fmt)
# axis(1, at = time(zz)[ix], labels = labs[ix], tcl = -0.7, cex.axis = 0.7)
axis(side = 1, at = tt[ix], labels = labs[ix], tcl = -0.7, cex.axis = 0.7)
legend("bottomright", colnames(zz), lty = 1, col = 1:2)

## plot a mulitple ts series with nice x-axis using panel function
tab <- ts(cbind(A = 1:24, B = 24:1), start = c(2006, 1), freq = 12)
pnl.xaxis <- function(...) {
     lines(...)
     panel.number <- parent.frame()$panel.number
     nser <- parent.frame()$nser
     # if bottom panel
     if (!length(panel.number) || panel.number == nser) { 
           tt <- list(...)[[1]]
           ym <- as.yearmon(tt)
	   mon <- as.numeric(format(ym, "%m"))
	   yy <- format(ym, "%y")
	   mm <- substring(month.abb[mon], 1, 1)
       if (any(mon == 1))
	    # axis(1, tt[mon == 1], yy[mon == 1], cex.axis = 0.7)
	    axis(side = 1, at = tt[mon == 1], labels = yy[mon == 1], cex.axis = 0.7)
	   # axis(1, tt[mon > 1], mm[mon > 1], cex.axis = 0.5, tcl = -0.3)
	   axis(side = 1, at = tt[mon > 1], labels = mm[mon > 1], cex.axis = 0.5, tcl = -0.3)
     }
}
plot(as.zoo(tab), panel = pnl.xaxis, xaxt = "n", main = "Fancy X Axis")

## Another example with a custom axis
# test data
z <- zoo(matrix(1:25, 5), c(10,11,20,21))
colnames(z) <- letters[1:5]

plot(zoo(coredata(z)), xaxt = "n", panel = function(x, y, ..., Time = time(z)) {
    lines(x, y, ...)
    # if bottom panel
    pf <- parent.frame()
    if (with(pf, panel.number %% nr == 0 || panel.number == nser)) {
        axis(side = 1, at = x, labels = Time)
    }
})


## plot with left and right axes
## modified from http://www.mayin.org/ajayshah/KB/R/html/g6.html
set.seed(1)
z <- zoo(cbind(A = cumsum(rnorm(100)), B = cumsum(rnorm(100, mean = 0.2))))
opar <- par(mai = c(.8, .8, .2, .8))
plot(z[,1], type = "l", 
  xlab = "x-axis label", ylab = colnames(z)[1])
par(new = TRUE)
plot(z[,2], type = "l", ann = FALSE, yaxt = "n", col = "blue")
# axis(4)
axis(side = 4)
legend(x = "topleft", bty = "n", lty = c(1,1), col = c("black", "blue"),
  legend = paste(colnames(z), c("(left scale)", "(right scale)")))
usr <- par("usr")
# if you don't care about srt= in text then mtext is shorter:
#   mtext(colnames(z)[2], 4, 2, col = "blue")
text(usr[2] + .1 * diff(usr[1:2]), mean(usr[3:4]), colnames(z)[2],
  srt = -90, xpd = TRUE, col = "blue")
par(opar)


## another plot with left and right axes
## modified from https://stat.ethz.ch/pipermail/r-help/2014-May/375293.html
d1 <- c(38.2, 18.1, 83.2, 42.7, 22.8, 48.1, 81.8, 129.6, 52.0, 110.3)
d2 <- c(2.2, 0.8, 0.7, 1.6, 0.9, 0.9, 1.1, 2.8, 5.1, 2.1)
z1 <- zooreg(d1, start = as.POSIXct("2013-01-01 00:00:01"), frequency = 0.0000006)
z2 <- zooreg(d2, start = as.POSIXct("2013-01-01 00:00:20"), frequency = 0.0000006)
zt <- zooreg(rnorm(1050), start = as.POSIXct("2013-01-01 00:00:01"), frequency = 0.00007)
z <- merge(zt, z1, z2, all = TRUE)
z <- na.spline(z[,2:3], na.rm = FALSE)
## function to round up to a number divisible by n (2011 by Owen Jones)
roundup <- function(x, n) ceiling(ceiling(x)/n) * n
## plot how to match secondary y-axis ticks to primary ones
plot(z$z1, ylim = c(0, signif(max(na.omit(z$z1)), 2)), xlab = "")
## use multiplication for even tick numbers and fake sekondary y-axis
max.yl <- roundup(max(na.omit(z$z2)), par("yaxp")[3])
multipl.yl <- max(na.omit(z$z2)) / max.yl
multipl.z2 <- signif(max(na.omit(z$z1) * 1.05), 2)/max.yl
lines(z$z2 * multipl.z2, lty = 2)
at4 <- axTicks(4)
axis(4, at = at4, seq(0, max.yl, length.out = par("yaxp")[3] + 1))


# automatically placed point labels
## Not run: 
##D library("maptools")
##D pointLabel(time(z), coredata(z[,2]), labels = format(time(z)), cex = 0.5)
## End(Not run)

## plot one zoo series against the other.
plot(x, x2)
plot(x, x2, xy.labels = TRUE)
plot(x, x2, xy.labels = 1:5, xy.lines = FALSE)

## shade a portion of a plot and make axis fancier

v <- zooreg(rnorm(50), start = as.yearmon(2004), freq = 12)

plot(v, type = "n")
u <- par("usr")
rect(as.yearmon("2007-8"), u[3], as.yearmon("2009-11"), u[4], 
   border = 0, col = "grey")
lines(v)
axis(1, floor(time(v)), labels = FALSE, tcl = -1)

## shade certain times to show recessions, etc.
v <- zooreg(rnorm(50), start = as.yearmon(2004), freq = 12)
plot(v, type = "n")
u <- par("usr")
rect(as.yearmon("2007-8"), u[3], as.yearmon("2009-11"), u[4], 
   border = 0, col = "grey")
lines(v)
axis(1, floor(time(v)), labels = FALSE, tcl = -1)

## fill area under plot

pnl.xyarea <- function(x, y, fill.base = 0, col = 1, ...) {
       lines(x, y, ...)
       panel.number <- parent.frame()$panel.number
	   col <- rep(col, length = panel.number)[panel.number]
       polygon(c(x[1], x, tail(x, 1), x[1]), 
		c(fill.base, as.numeric(y), fill.base, fill.base), col = col)
}
plot(zoo(EuStockMarkets), col = rainbow(4), panel = pnl.xyarea)


## barplot
x <- zoo(cbind(rpois(5, 2), rpois(5, 3)), x.Date)
barplot(x, beside = TRUE)

## 3d plot
## The persp function in R (not part of zoo) works with zoo objects.
## The following example is by Enrico Schumann.
## https://stat.ethz.ch/pipermail/r-sig-finance/2009q1/003710.html
nC <- 10    # columns
nO <- 100 # observations
dataM <- array(runif(nC * nO), dim=c(nO, nC))
zz <- zoo(dataM, 1:nO)
persp(1:nO, 1:nC, zz)

# interactive plotting
## Not run: 
##D library("TeachingDemos")
##D tke.test1 <- list(Parameters = list(
##D 	lwd = list("spinbox", init = 1, from = 0, to = 5, increment = 1, width = 5),
##D 	lty = list("spinbox", init = 1, from = 0, to = 6, increment = 1, width = 5)
##D ))
##D z <- zoo(rnorm(25))
##D tkexamp(plot(z), tke.test1, plotloc = "top")
## End(Not run)

# setting ylim on a multi-panel plot - 2nd panel y axis range is 1-50
data("anscombe", package = "datasets")
ans6 <- zoo(anscombe[, 1:6])
screens <- c(1, 1, 2, 2, 3, 3)
ylim <- unname(tapply(as.list(ans6), screens, range))
ylim[[2]] <- 1:50 # or ylim[[2]] <- c(1, 50)
plot(ans6, screens = screens, ylim = ylim) 




