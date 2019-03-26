## ----echo=FALSE, results="hide"------------------------------------------
knitr::opts_chunk$set(
  error=FALSE,
  fig.width=7,
  fig.height=5)
set.seed(1)

## ----echo = FALSE, results = "asis"--------------------------------------
local({
  path <- system.file("examples/ring_vector.R", package = "ring")
  source(path, local = FALSE)
  writeLines(c("```r", readLines(path), "```"))
})

## ------------------------------------------------------------------------
v <- ring_vector(5, "integer", FALSE)

## ------------------------------------------------------------------------
v[]

## ------------------------------------------------------------------------
push(v, 1L)
v[]

## ------------------------------------------------------------------------
push(v, 2:4)
v[]
length(v)

## ------------------------------------------------------------------------
v[3]
v[[1]]

## ------------------------------------------------------------------------
v$buf$reset()
length(v)

## ------------------------------------------------------------------------
buf <- ring_vector(5, "integer", FALSE)
h <- integer(20)
x <- 0L
push(buf, x)
h[1L] <- x

step <- function(x) {
  if (runif(1) < 0.5) x - 1L else x + 1L
}

set.seed(1)
for (i in seq_len(length(h) - 1L)) {
  x <- step(x)
  push(buf, x)
  h[i + 1L] <- x
}

## ------------------------------------------------------------------------
h

## ------------------------------------------------------------------------
buf[]

## ------------------------------------------------------------------------
step <- function(x) {
  if (length(x) > 1) {
    p <- mean(diff(x[])) / 2 + 0.5
  } else {
    p <- 0.5
  }
  if (runif(1) < p) x[length(x)] - 1L else x[length(x)] + 1L
}

buf <- ring_vector(5, "integer", FALSE)
h <- integer(100)
x <- 0L

push(buf, x)
h[1L] <- x

set.seed(1)
for (i in seq_len(length(h) - 1L)) {
  x <- step(buf)
  push(buf, x)
  h[i + 1L] <- x
}

par(mar=c(4, 4, .5, .5))
plot(h, type="l", xlab="step", ylab="y", las=1)

## ----echo = FALSE, results = "asis"--------------------------------------
local({
  path <- system.file("examples/ring_matrix.R", package = "ring")
  source(path, local = FALSE)
  dat <- readLines(path)
  writeLines(c("```r", dat[!grepl("^###", dat)], "```"))
})

## ------------------------------------------------------------------------
n <- 10
m <- ring_matrix(5, n, "integer", FALSE)

## ------------------------------------------------------------------------
m[]

## ------------------------------------------------------------------------
push(m, matrix(0L, 1, n))
m[]

step <- function(m) {
  if (nrow(m) > 1) {
    p <- colMeans(diff(m[])) / 2 + 0.5
  } else {
    p <- rep(0.5, ncol(m))
  }
  m[nrow(m), ] + as.integer(ifelse(runif(length(p)) < p, -1, 1L))
}

m <- ring_matrix(5, n, "integer", FALSE)
x <- rep(0L, n)
push(m, x)

h <- matrix(NA, 200, n)
h[1, ] <- x
set.seed(1)
for (i in seq_len(nrow(h) - 1L)) {
  x <- step(m)
  push(m, x)
  h[i + 1L, ] <- x
}

par(mar=c(4, 4, .5, .5))
matplot(h, type="l", lty=1, las=1)

