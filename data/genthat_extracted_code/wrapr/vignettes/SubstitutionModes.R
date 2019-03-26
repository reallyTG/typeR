## ----exlang--------------------------------------------------------------
library("wrapr")

let(
  c(X = 'y', F = 'sin'), 
  {
    d <- data.frame("X" = "X", X2 = "XX", d = X*X, .X = X_)
    X <- list(X = d$X, X2 = d$"X", v1 = `X`, v2 = ` X`, F(1:2))
    X$a
    "X"$a
    X = function(X, ...) { X + 1 }
  },
  eval = FALSE, subsMethod = 'langsubs')

## ----exstr---------------------------------------------------------------
let(
  c(X = 'y', F = 'sin'), 
  {
    d <- data.frame("X" = "X", X2 = "XX", d = X*X, .X = X_)
    X <- list(X = d$X, X2 = d$"X", v1 = `X`, v2 = ` X`, F(1:2))
    X$a
    "X"$a
    X = function(X, ...) { X + 1 }
  },
  eval = FALSE, subsMethod = 'stringsubs')

## ----exsubs--------------------------------------------------------------
let(c(X = 'y', F = 'sin'), 
    {
      d <- data.frame("X" = "X", X2 = "XX", d = X*X, .X = X_)
      X <- list(X = d$X, X2 = d$"X", v1 = `X`, v2 = ` X`, F(1:2))
      X$a
      "X"$a
      X = function(X, ...) { X + 1 }
    },
    eval = FALSE, subsMethod = 'subsubs')

