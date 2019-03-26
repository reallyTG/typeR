library(suropt)


### Name: build_surmodel
### Title: Build an surmodel object
### Aliases: build_surmodel

### ** Examples


fn <- function(x) list(y = x^2)
model <- build_surmodel(fn, 20, 1)

fn <- function(x) list(y = DiceKriging::branin(x))
model <- build_surmodel(fn, 20, 2)

fn <- function(x) list(y = DiceKriging::branin(x), g = 0.2 - prod(x))
model <- build_surmodel(fn, 20, 2)

fn <- shaffer2
model <- build_surmodel(fn, 20, 1)

fn <- binh
model <- build_surmodel(fn, 20, 2)

data <- data.frame(X.1 = runif(5), X.2 = runif(5), Y.1 = runif(5))
model <- build_surmodel(data)

data <- data.frame(X.1 = runif(5), X.2 = runif(5), Y.1 = runif(5), G.1 = rnorm(5))
model <- build_surmodel(data)



