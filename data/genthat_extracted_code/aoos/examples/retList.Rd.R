library(aoos)


### Name: retList
### Title: Generic constructor function
### Aliases: retList funNames asEnv stripSelf

### ** Examples

# To get a quick overview of the package:
vignette("Introduction", "aoos")

# To get more infos about retList:
vignette("retListClasses", "aoos")

# To get some infos about performance:
vignette("performance", "aoos")

# A simple class with one method:
Test <- function(.x) {
  getX <- function() .x
  retList("Test")
}

stopifnot(Test(2)$getX() == 2)

# A second example inheriting from Test
Test2 <- function(.y) {
  getX2 <- function() .x * 2
  retList("Test2", super = Test(.y))
}

stopifnot(Test2(2)$getX() == 2)
stopifnot(Test2(2)$getX2() == 4)

### Rational numbers example with infix operators and print method

Rational <- function(numer, denom) {

  gcd <- function(a, b) if(b == 0) a else Recall(b, a %% b)

  g <- gcd(numer, denom)
  numer <- numer / g
  denom <- denom / g

  print <- function(x, ...) cat(paste0(numer, "/", denom, "\n"))

  ".+" <- function(that) {
    Rational(numer = numer * that$denom + that$numer * denom,
             denom = denom * that$denom)
  }

  ".-" <- function(that) {
    if (missing(that)) {
      Rational(-numer, denom)
    } else {
      .self + (-that)
    }
  }

  # Return only what should be visible from this scope:
  retList(c("Rational", "Infix", "Print"),
          c("numer", "denom", "neg", "print"))

}

rational <- Rational(2, 3)
rational + rational
rational - rational



