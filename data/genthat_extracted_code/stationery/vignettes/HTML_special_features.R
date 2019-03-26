## ----setup, include=FALSE-------------------------------------------
##This Invisible Chunk is required in all CRMDA documents
outdir <- paste0("tmpout")
if (!file.exists(outdir)) dir.create(outdir, recursive = TRUE)
knitr::opts_chunk$set(echo=TRUE, comment=NA, fig.path=paste0(outdir, "/p-"))
options(width = 70)
set.seed(123123)

## ----themecopy, include = FALSE-------------------------------------
library(stationery)
## If theme directory does not have required images or TeX files
## we need to retrieve them and put them in "theme" directory. 
logos <- c(logoleft = "logoleft.png", 
           logoright = "logo-vert.png",
           "R.bib")
files <- c("kutils.css", 
           "guide-template.html")
getFiles(logos, pkg = "stationery")
getFiles(files, pkg = "stationery")

## ----xsummary-------------------------------------------------------
dat <- data.frame(x=rnorm(1000), y=rpois(1000, l=7))
summary(dat)

## ----fig, fig=T, fig.height=2.5, fig.width=5------------------------
hist(dat$x, xlab = "Monkey Weight (deviations)", main = "Histogram", prob = TRUE, ylim = c(0, 1))

## ----xsummary2, fig=T-----------------------------------------------
dat <- data.frame(x=rgamma(1000, 1.4))
hist(dat$x)

## ----chunk10--------------------------------------------------------
set.seed(234234)
x <- rnorm(100)
mean(x)

## ----chunk20, eval=F------------------------------------------------
#  set.seed(234234)
#  x <- rnorm(100)
#  mean(x)

## ----chunk30, echo=F------------------------------------------------
x <- rnorm(100)
mean(x)

## ----chunk40, include=F---------------------------------------------
set.seed(234234)
x <- rnorm(100)
mean(x)

## ----chunk50, fig=T, fig.height=3, fig.width=4, fig.show="hold", echo=F----
hist(x, main = "One Histogram Displayed Inline")

## ----chunk65, fig=T, fig.height=3, fig.width=4, fig.show="hide", dev=c('png'),fig.cap="A caption"----
hist(x, main = "Another Histogram")

## ----chunk71, eval=F, echo=TRUE, warning=FALSE----------------------
#  par(mar = c(3,2,0.5,0.5))
#  cax <- 0.7 ## cex.axis
#  plot(c(0, 1), c(0, 1), xlim = c(0,1), ylim = c(0,1), type = "n", ann = FALSE, axes = FALSE)
#  rect(0, 0, 1, 1, col = "light grey", border = "grey")
#  axis(1, tck = 0.01, pos = 0, cex.axis = cax, padj = -2.8, lwd = 0.3,
#        at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
#  axis(2, tck = 0.01, pos = 0, cex.axis = cax, padj = 2.8, lwd = 0.3,
#       at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
#  mtext(expression(x), side = 1, line = 0.5, at = .5, cex = cax)
#  mtext(expression(y), side = 2, line = 0.5, at = .5, cex = cax)
#  mtext(c("Min x", "Max x"), side = 1, line = -0.5, at = c(0.05, 0.95), cex = cax)
#  mtext(c("Min y", "Max y"), side = 2, line = -0.5, at = c(0.05, 0.95), cex = cax)
#  lines(c(.6, .6, 0), c(0, .6, .6), lty = "dashed")
#  text(.6, .6, expression(paste("The location ",
#                  group("(",list(x[i] == .6, y[i] == .6),")"))), pos = 3, cex = cax + 0.1)
#  points(.6, .6, pch = 16)

## ----chunk75, ref.label='chunk71', echo=F, fig=T, fig.keep="last", fig.width=5, fig.height=5, fig.cap="A Special Figure", fig.align="center"----
par(mar = c(3,2,0.5,0.5))
cax <- 0.7 ## cex.axis
plot(c(0, 1), c(0, 1), xlim = c(0,1), ylim = c(0,1), type = "n", ann = FALSE, axes = FALSE)
rect(0, 0, 1, 1, col = "light grey", border = "grey")
axis(1, tck = 0.01, pos = 0, cex.axis = cax, padj = -2.8, lwd = 0.3,
      at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
axis(2, tck = 0.01, pos = 0, cex.axis = cax, padj = 2.8, lwd = 0.3,
     at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
mtext(expression(x), side = 1, line = 0.5, at = .5, cex = cax)
mtext(expression(y), side = 2, line = 0.5, at = .5, cex = cax)
mtext(c("Min x", "Max x"), side = 1, line = -0.5, at = c(0.05, 0.95), cex = cax)
mtext(c("Min y", "Max y"), side = 2, line = -0.5, at = c(0.05, 0.95), cex = cax)
lines(c(.6, .6, 0), c(0, .6, .6), lty = "dashed")
text(.6, .6, expression(paste("The location ",
                group("(",list(x[i] == .6, y[i] == .6),")"))), pos = 3, cex = cax + 0.1)
points(.6, .6, pch = 16)

## ----chunk76, ref.label='chunk71', echo=F, fig=T, include=F, fig.keep="all", fig.width=4, fig.height=4, dev=c('png')----
par(mar = c(3,2,0.5,0.5))
cax <- 0.7 ## cex.axis
plot(c(0, 1), c(0, 1), xlim = c(0,1), ylim = c(0,1), type = "n", ann = FALSE, axes = FALSE)
rect(0, 0, 1, 1, col = "light grey", border = "grey")
axis(1, tck = 0.01, pos = 0, cex.axis = cax, padj = -2.8, lwd = 0.3,
      at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
axis(2, tck = 0.01, pos = 0, cex.axis = cax, padj = 2.8, lwd = 0.3,
     at = seq(0, 1, by = 0.2), labels = c("", seq(0.2,0.8, by=0.2), ""))
mtext(expression(x), side = 1, line = 0.5, at = .5, cex = cax)
mtext(expression(y), side = 2, line = 0.5, at = .5, cex = cax)
mtext(c("Min x", "Max x"), side = 1, line = -0.5, at = c(0.05, 0.95), cex = cax)
mtext(c("Min y", "Max y"), side = 2, line = -0.5, at = c(0.05, 0.95), cex = cax)
lines(c(.6, .6, 0), c(0, .6, .6), lty = "dashed")
text(.6, .6, expression(paste("The location ",
                group("(",list(x[i] == .6, y[i] == .6),")"))), pos = 3, cex = cax + 0.1)
points(.6, .6, pch = 16)

## ----chunk76b-------------------------------------------------------
list.files("tmpout", pattern="p-chunk76.*png") 

## ---- warning = FALSE, error = FALSE, message= FALSE, include=FALSE----
library(rockchalk)
   set.seed(2134234)
   dat <- data.frame(x1 = rnorm(100), x2 = rnorm(100))
   dat$y1 <- 30 + 5 * rnorm(100) + 3 * dat$x1 + 4 * dat$x2
   dat$y2 <- rnorm(100) + 5 * dat$x2
   m1 <- lm(y1 ~ x1, data = dat)
   m2 <- lm(y1 ~ x2, data = dat)
   m3 <- lm(y1 ~ x1 + x2, data = dat)
   gm1 <- glm(y1 ~ x1, family = Gamma, data = dat)

or1 <- outreg(list("Amod" = m1, "Bmod" = m2, "Gmod" = m3),
title = "My Three Linear Regressions", float = FALSE, type = "html",
browse = FALSE)
or1 <- gsub("&nbsp;", " ", or1)
## eliminate spaces at beginning of rows
or1 <- gsub("^\\s+", "", or1)
## Change multiple spaces to single spaces:
or1 <- gsub("\\s+", " ", or1)
or1 <- paste(or1, collapse = "")

## ----results="asis"-------------------------------------------------
cat(or1)

## ---- results="asis"------------------------------------------------
library(pander)    
sum <- summary(m1)
pander(sum$coefficients)

## ---- results="asis"------------------------------------------------
library(psych)
pander(describe(dat))

## ----sessionInfo, echo = FALSE--------------------------------------
sessionInfo()

## ----warnings, echo = FALSE-----------------------------------------
if(!is.null(warnings())) {
    print("Warnings:")
    warnings()
}

