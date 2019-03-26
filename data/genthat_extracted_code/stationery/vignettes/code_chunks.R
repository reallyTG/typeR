## ----setup, include=FALSE-------------------------------------------
##This Invisible Chunk is required in all CRMDA documents
tmpdir <- paste0("tmpout")
if (!dir.exists(tmpdir)) dir.create(tmpdir, recursive = TRUE)
knitr::opts_chunk$set(echo=TRUE, comment=NA, fig.path=paste0(tmpdir, "/p-"))
options(width = 70)
options(width = 70)

## ----themecopy, include = FALSE-------------------------------------
## not needed b/c this vignette has custom files in theme folder
library(stationery)
files1 <- c("logoleft.pdf", "logo-vert.pdf",  "report-template.tex", "R.bib")
getFiles(files1, pkg = "stationery")
files2 <- c("guide-template.tex")
getFiles(files2, pkg = "stationery")

## ----chunk10--------------------------------------------------------
set.seed(234234)
x <- rnorm(100)
mean(x)

## ----chunk20, eval=F------------------------------------------------
#  set.seed(234234)
#  x <- rnorm(100)
#  mean(x)

## ----chunk30, echo=F------------------------------------------------
set.seed(234234)
x <- rnorm(100)
mean(x)

## ----chunk40, include=F---------------------------------------------
set.seed(234234)
x <- rnorm(100)
mean(x)

## ----chunk50, fig=T, fig.height=3, fig.width=4, fig.show="hold", echo=F----
hist(x, main = "One Histogram Displayed Inline")

## ----chunk60, fig=T, fig.height=3, fig.width=4, fig.show="hold", echo=F, fig.cap = "\\label{fig:hfloat}A Floating Histogram"----
hist(x, main = "One Histogram")

## ----chunk65, fig=T, fig.height=3, fig.width=4, fig.show="hide", dev=c("pdf", "png"), echo=F----
hist(x, main = "Another Histogram")

## ----chunk70, echo=F, include=F-------------------------------------
## alter par, after keeping copy
par.orig <- par(no.readonly = FALSE)
par(xaxs="i", yaxs="i", xpd=FALSE)

## ----chunk71, eval=F, echo=TRUE, warning=FALSE, collapse=TRUE-------
#  plot(c(0, 1), c(0, 1), xlim = c(0,1), ylim = c(0,1), type = "n", ann = FALSE, axes = F)
#  rect(0, 0, 1, 1, col = "light grey", border = "grey")
#  axis(1, tck = 0.01, pos = 0, cex.axis = 0.6, padj = -3, lwd = 0.8,
#       at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
#  axis(2, tck = 0.01, pos = 0, cex.axis = 0.6, padj = 3, lwd = 0.3,
#       at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
#  mtext(expression(x), side = 1, line = 0.5, at = .6, cex = .6)
#  mtext(expression(y), side = 2, line = 0.5, at = .6, cex = .6)
#  mtext(c("Min x", "Max x"), side = 1, line = -0.5, at = c(0.05, 0.95), cex = .6)
#  mtext(c("Min y", "Max y"), side = 2, line = -0.5, at = c(0.05, 0.95), cex = .6)
#  lines(c(.6, .6, 0), c(0, .6, .6), lty = "dashed")
#  text(.6, .6, expression(paste("The location ",
#                                group("(",list(x[i] == .6, y[i] == .6),")"))), pos = 3, cex = .7)
#  points(.6, .6, pch = 16)

## ----chunk75, ref.label='chunk71', echo=F, fig=T, fig.keep="last", collapse=T, fig.width=5, fig.height=5----
plot(c(0, 1), c(0, 1), xlim = c(0,1), ylim = c(0,1), type = "n", ann = FALSE, axes = F)
rect(0, 0, 1, 1, col = "light grey", border = "grey")
axis(1, tck = 0.01, pos = 0, cex.axis = 0.6, padj = -3, lwd = 0.8,
     at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
axis(2, tck = 0.01, pos = 0, cex.axis = 0.6, padj = 3, lwd = 0.3,
     at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
mtext(expression(x), side = 1, line = 0.5, at = .6, cex = .6)
mtext(expression(y), side = 2, line = 0.5, at = .6, cex = .6)
mtext(c("Min x", "Max x"), side = 1, line = -0.5, at = c(0.05, 0.95), cex = .6)
mtext(c("Min y", "Max y"), side = 2, line = -0.5, at = c(0.05, 0.95), cex = .6)
lines(c(.6, .6, 0), c(0, .6, .6), lty = "dashed")
text(.6, .6, expression(paste("The location ",
                              group("(",list(x[i] == .6, y[i] == .6),")"))), pos = 3, cex = .7)
points(.6, .6, pch = 16)

## ----chunk76, ref.label='chunk71', echo=F, fig=T, include=F, fig.keep="all", collapse=T, fig.width=4, fig.height=4, dev=c('pdf')----
plot(c(0, 1), c(0, 1), xlim = c(0,1), ylim = c(0,1), type = "n", ann = FALSE, axes = F)
rect(0, 0, 1, 1, col = "light grey", border = "grey")
axis(1, tck = 0.01, pos = 0, cex.axis = 0.6, padj = -3, lwd = 0.8,
     at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
axis(2, tck = 0.01, pos = 0, cex.axis = 0.6, padj = 3, lwd = 0.3,
     at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
mtext(expression(x), side = 1, line = 0.5, at = .6, cex = .6)
mtext(expression(y), side = 2, line = 0.5, at = .6, cex = .6)
mtext(c("Min x", "Max x"), side = 1, line = -0.5, at = c(0.05, 0.95), cex = .6)
mtext(c("Min y", "Max y"), side = 2, line = -0.5, at = c(0.05, 0.95), cex = .6)
lines(c(.6, .6, 0), c(0, .6, .6), lty = "dashed")
text(.6, .6, expression(paste("The location ",
                              group("(",list(x[i] == .6, y[i] == .6),")"))), pos = 3, cex = .7)
points(.6, .6, pch = 16)

## ----chunk76b-------------------------------------------------------
list.files("tmpout", pattern="p-chunk76.*pdf")

## ----chunk79, echo=F, include=F-------------------------------------
par(par.orig)

## ----chunk80, echo=F, include=F-------------------------------------
## alter par, after keeping copy
par.orig <- par(no.readonly = FALSE)
par(xaxs="i", yaxs="i", xpd=FALSE)

## ----outreg, results='asis'-----------------------------------------
set.seed(234234)
dat <- data.frame(x1 = rnorm(100), x2 = rnorm(100), y = rnorm(100))
library(rockchalk)
m1 <- lm(y ~ x1, data = dat)
m2 <- lm(y ~ x1 + x2, data = dat)
vl <- c("x1" = "Excellent Predictor", "x2" = "Adequate Predictor")
outreg(list("First Model" = m1, "Second Model" = m2), varLabels = vl,
      tight = FALSE, type = "latex")

## ----sessionInfo, echo = FALSE--------------------------------------
sessionInfo()

## ----warnings, echo = FALSE-----------------------------------------
if(!is.null(warnings())){
    print("Warnings:")
    warnings()
}

