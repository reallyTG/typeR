## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse  = TRUE, 
  comment   = "#>",
  fig.width = 7.15,
  fig.height = 3.5,
  echo = FALSE,
  message = FALSE)

library(crossrun)

## ----fig1, fig.cap="Figure 1"--------------------------------------------
set.seed(32)
n <- 24
y <- rnorm(n)
x <- seq(n)

op <- par(mar = c(bottom = 0, left   = 0, top    = 0, right  = 0))

plot(x, y,
     axes = FALSE,
     type = "b",
     pch  = '',
     lwd  = 1.5,
     ylab = '',
     xlab = '')

lines(x, rep(median(y), n),
      col = 'grey40')

text(x, y)

par(op)

## ----symm15, echo=FALSE, message=FALSE-----------------------------------
library(crossrun)
j15s <- joint15symm
rownames(j15s)[1] <- "C = 0"
colnames(j15s)[1] <- "L = 1"
knitr::kable(j15s, caption = 'Table 1')

## ----p6.15, echo=FALSE, message=FALSE, fig.width=15----------------------
p6.15 <- joint15.6
rownames(p6.15)[1] <- "C = 0"
colnames(p6.15)[1] <- "L = 1"

knitr::kable(round(p6.15,1), caption = 'Table 2')

## ----exact1, message=FALSE, echo=T---------------------------------------
library(crossrun)
library(Rmpfr)

exact1   <- asNumeric((2^4) * exactbin(n = 5, p = 0.6))
iter1    <- asNumeric(crossrunbin(nmax = 5, prob = 0.6)$pt[[5]])
compare1 <- cbind(exact1,iter1)

compare1

## ----bincoeff15, message=FALSE, echo=T-----------------------------------
library(crossrun)
library(Rmpfr)

bincoeff14           <- Rmpfr::chooseMpfr.all(14) # binomial coefficients, n - 1 = 14
bincoeff14iter       <- cumsumm(j15s)[-1, 15]     # row sums, n - 1 = 14
compare15            <- rbind(asNumeric(bincoeff14), bincoeff14iter)
row.names(compare15) <- c("exact","iter")

compare15
max(abs(bincoeff14 - bincoeff14iter))

## ----sim15, message=FALSE, echo=T----------------------------------------
library(crossrun)
set.seed(83938487)
sim15 <- simclbin(nser = 15, nsim = 10000)
(matrix(0:14, nrow = 1) %*% p6.15 %*% matrix(1:15, ncol = 1)) / 2^14
mean(sim15$nc0.6 * sim15$lr0.6)

## ----sim15plot, message=FALSE--------------------------------------------
library(crossrun)

plot(x      = as.numeric(names(table(sim15$nc0.6))),
     y      = (cumsum(cumsumm(p6.15)[,15]) /
                 (2^14))[as.numeric(names(table(sim15$nc0.6))) + 1],
     type   = "l",
     xlab   = "Number of crossings",
     ylab   = "CDF",
     las    = 1)
points(x    = as.numeric(names(table(sim15$nc0.6))),
       y    = cumsum(table(sim15$nc0.6))/sum(table(sim15$nc0.6)),
       type = "l",
       col  = "red",
       lty  = "dotted")
lines(x     = c(0, 1),
      y     = c(0.9, 0.9),
      col   = "red")
text(x      = 1,
     y      = 0.9,
     pos    = 4,
     labels = "red: simulations",
     col    = "red")

plot(x      = as.numeric(names(table(sim15$lr0.6))),
     y      = as.numeric(cumsum(cumsummcol(p6.15)[15,]) /
                           sum(cumsummcol(p6.15)[15,]))[
                             as.numeric(names(table(sim15$lr0.6)))],
     type   = "l",
     xlab   = "Longest run",
     ylab   = "CDF",
     las    = 1)
points(x    = as.numeric(names(table(sim15$lr0.6))),
       y    = cumsum(table(sim15$lr0.6))/sum(table(sim15$lr0.6)),
       type = "l",
       col  = "red",
       lty  = "dotted")
lines(x   = c(2, 3),
      y   = c(0.9, 0.9),
      col = "red")
text(x      = 3,
     y      = 0.9,
     pos    = 4,
     labels = "red: simulations",
     col    = "red")

