### R code from vignette source 'BspecFGN.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
op.orig <-
options(width = 75,
        SweaveHooks= list(fig=function() par(mar=c(5.1, 4.1, 1.1, 2.1))),
        useFancyQuotes = FALSE,
        ## for JSS, but otherwise MM does not like it:
        ## prompt="R> ",
        continue="  ")# 2 (or 3) blanks: use same length as 'prompt'

Sys.setenv(LANGUAGE = "en")
if(.Platform$OS.type != "windows")
  Sys.setlocale("LC_MESSAGES","C")


###################################################
### code chunk number 2: B.spec-ex
###################################################
require("longmemo")
fr <- .ffreq(500)
B.1   <- B.specFGN(fr, H = 0.75, nsum =   200, k.approx=NA)
B.xct <- B.specFGN(fr, H = 0.75, nsum = 10000, k.approx=NA)
all.equal(B.xct, B.1)


###################################################
### code chunk number 3: fB-def
###################################################
##               ^^^^^^ drop comments here
##' @title The function f(x) used in the approximation of  B.specFGN()
##' @param x  numeric vector of positive values
##' @param lambda number in [-pi, pi]; practically in (0, pi]
##' @param H  Hurst parameter in (0, 1); practically in (1/2, 1)
##' @return
##' @author Martin Maechler
fB <- function(x, lambda, H) {
    u <- 2*pi*x
    h <- -(2*H+1)
    (u + lambda)^h + (u - lambda)^h
}


###################################################
### code chunk number 4: curve-fB
###################################################
draw.f <- function(lambda, H, ..., log = "",
                   ylim= if(any("y" == strsplit(log,"")[[1]]))NULL else c(0, 2*fB1))
{
    fB1 <- fB(1, lambda=lambda, H = H)
    curve(fB(x, lambda=lambda, H = H), ylim=ylim, log=log, xaxt="n", ...)
    sfsmisc::eaxis(1)
    mtext(bquote(list(lambda == .(lambda), H == .(H))))
    abline(v = lambda / (2*pi), lty=2, lwd=3, col = "blue3")
    xrng <- par("usr")[1:2]; if(xlog <- par("xlog")) xrng <- 10^xrng
    abline(h = 0, lty=3, col="gray20")
    j <- floor(xrng[1]):ceiling(xrng[2])
    lines(j, fB(j, lambda=lambda, H = H), type = "h",
          lty=5, lwd= 0.75, col = "gray40")
    axis(1, at=j[j >= if(xlog) 2 else 1][1:2], col="green3")
}

op <- sfsmisc::mult.fig(4)$old.par
draw.f(lambda=.001, H = 0.75, 0, 10)
draw.f(lambda= 0.5, H = 0.75, 0, 10)
draw.f(lambda= 1.5, H = 0.75, 0, 10)
draw.f(lambda= 3.0, H = 0.75, 0, 10)



###################################################
### code chunk number 5: curve-fB-2
###################################################
sfsmisc::mult.fig(3)$old.par
draw.f(lambda=.001, H = 0.99, .001, 100, log="xy")
draw.f(lambda= .5,  H = 0.99, .001, 100, log="xy") ## !
draw.f(lambda= 3.0, H = 0.51, .001, 100, log="xy") ## !
par(op)


###################################################
### code chunk number 6: sessionInfo
###################################################
toLatex(sessionInfo())


###################################################
### code chunk number 7: finalizing
###################################################
options(op.orig)


