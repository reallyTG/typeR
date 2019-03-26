## ----echo=FALSE, message=FALSE-------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
library(TLMoments)
library(lmomco)
library(Lmoments)
library(lmom)
sessionInfo()

## ------------------------------------------------------------------------
n <- c(25, 50, 100, 200, 500, 1000, 10000, 50000)
sapply(n, function(nn) {
  x <- rgev(nn)
  check <- lmomco::lmoms(x, 4)$lambdas
  sapply(c("direct", "pwm", "recursive"), function(comp) {
    isTRUE(all.equal(TLMoment(x, order = 1:4, computation.method = comp), check, check.attributes = FALSE))
  })
})

## ------------------------------------------------------------------------
possib <- list(
  TLMoments_direct = function(x) TLMoments(x, max.order = 4, computation.method = "direct"), 
  TLMoments_pwm = function(x) TLMoments(x, max.order = 4, computation.method = "pwm"), 
  TLMoments_recursive = function(x) TLMoments(x, max.order = 4, computation.method = "recursive"), 
  lmomco = function(x) lmomco::lmoms(x, 4), 
  Lmoments = function(x) Lmoments::Lmoments(x, returnobject = TRUE)
)

# n = 50
datalist <- replicate(200, rgev(50), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

# n = 1000
datalist <- replicate(200, evd::rgev(1000), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

## ------------------------------------------------------------------------
possib <- list(
  TLMoments_direct = function(x) TLMoment(x, order = 1:4, computation.method = "direct"), 
  TLMoments_pwm = function(x) TLMoment(x, order = 1:4, computation.method = "pwm"), 
  TLMoments_recursive = function(x) TLMoment(x, order = 1:4, computation.method = "recursive"), 
  lmom = function(x) lmom::samlmu(x, 4), 
  Lmoments = function(x) Lmoments::Lmoments(x, returnobject = FALSE)
)

# n = 50
datalist <- replicate(200, rgev(50), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

# n = 1000
datalist <- replicate(200, rgev(1000), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

## ------------------------------------------------------------------------
n <- c(25, 50, 100, 150, 200, 500, 1000, 10000)
names(n) <- paste("n", n, sep = "=")
sapply(n, function(nn) {
  x <- rgev(nn)
  check <- lmomco::TLmoms(x, 4, leftrim = 0, rightrim = 1)$lambdas
  sapply(c("direct", "pwm", "recursive", "recurrence"), function(comp) {
    tlm <- suppressWarnings(TLMoments(x, rightrim = 1, computation.method = comp)$lambdas)
    isTRUE(all.equal(tlm, check, check.attributes = FALSE))
  })
})
sapply(n, function(nn) {
  x <- rgev(nn)
  check <- lmomco::TLmoms(x, 4, leftrim = 2, rightrim = 4)$lambdas
  sapply(c("direct", "pwm", "recursive", "recurrence"), function(comp) {
    tlm <- suppressWarnings(TLMoments(x, leftrim = 2, rightrim = 4, computation.method = comp)$lambdas)
    isTRUE(all.equal(tlm, check, check.attributes = FALSE))
  })
})

## ------------------------------------------------------------------------
possib <- list(
  TLMoments_direct = function(x) TLMoments(x, leftrim = 0, rightrim = 1, max.order = 4, computation.method = "direct"), 
  TLMoments_pwm = function(x) TLMoments(x, leftrim = 0, rightrim = 1, max.order = 4, computation.method = "pwm"), 
  TLMoments_recurrence = function(x) TLMoments(x, leftrim = 0, rightrim = 1, max.order = 4, computation.method = "recurrence"), 
  lmomco = function(x) lmomco::TLmoms(x, 4, leftrim = 0, rightrim = 1)
)

# n = 50
datalist <- replicate(200, rgev(50), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

# n = 1000
datalist <- replicate(200, rgev(1000), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

## ------------------------------------------------------------------------
possib <- list(
  TLMoments_direct = function(x) TLMoments(x, leftrim = 2, rightrim = 4, max.order = 4, computation.method = "direct"), 
  TLMoments_pwm = function(x) TLMoments(x, leftrim = 2, rightrim = 4, max.order = 4, computation.method = "pwm"), 
  TLMoments_recurrence = function(x) TLMoments(x, leftrim = 2, rightrim = 4, max.order = 4, computation.method = "recurrence"), 
  lmomco = function(x) lmomco::TLmoms(x, 4, leftrim = 2, rightrim = 4)
)

# n = 50
datalist <- replicate(200, evd::rgev(50), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

# n = 1000
datalist <- replicate(200, evd::rgev(1000), simplify = FALSE)

do.call("rbind", lapply(possib, function(f) {
  system.time(lapply(datalist, f))[3]
}))

