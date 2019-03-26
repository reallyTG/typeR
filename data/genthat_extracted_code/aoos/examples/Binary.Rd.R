library(aoos)


### Name: Binary-class
### Title: Binary-class
### Aliases: Binary-class

### ** Examples

Rational <- defineClass("Rational", contains = c("Show", "Binary"), {

  numer <- 0
  denom <- 1
  .g <- 1
  
  .gcd <- function(a, b) if(b == 0) a else Recall(b, a %% b)

  init <- function(numer, denom) {
    .self$.g <- .gcd(numer, denom)
    .self$numer <- numer / .g
    .self$denom <- denom / .g
  }
  
  show <- function() {
    cat(paste0(.self$numer, "/", .self$denom, "\n"))
  }
  
  ".+" <- function(that) {
    Rational(numer = numer * that$denom + that$numer * denom,
             denom = denom * that$denom)
  }
  
  neg <- function() {
    Rational(numer = -.self$numer,
             denom = .self$denom)
  }
  
  ".-" <- function(that) {
     .self + that$neg()
  }
  
})

rational <- Rational(2, 3)
rational + rational
rational$neg()
rational - rational



