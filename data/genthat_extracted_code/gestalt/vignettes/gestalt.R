## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(gestalt)

fit <- mpg ~ wt

r2 <- {split(mtcars, mtcars[[.]])} %>>>%
  lapply(function(data) lm(!!fit, data)) %>>>%
  summarize: (
    lapply(summary) %>>>%
      stat: sapply(`[[`, "r.squared")
  )

r2("cyl")

## ------------------------------------------------------------------------
r2[1:2]("cyl")[["6"]]  # Cars with 6 cylinders

## ------------------------------------------------------------------------
residuals <- r2
residuals$summarize$stat <- function(s) sapply(s, `[[`, "residuals")
residuals("cyl")[["6"]]

## ------------------------------------------------------------------------
scramble <- sample %>>>% toupper %>>>% paste(collapse = "")

set.seed(1)
scramble(letters, 5)

## ------------------------------------------------------------------------
stepwise <- lapply(`%>>>%`, print) %>>>% compose

## ------------------------------------------------------------------------
set.seed(1)
stepwise(scramble)(letters, 5)

## ------------------------------------------------------------------------
library(magrittr)

mtcars %>% 
  split(.$cyl) %>% 
  lapply(function(data) lm(mpg ~ wt, data)) %>% 
  lapply(summary) %>% 
  sapply(`[[`, "r.squared")

## ------------------------------------------------------------------------
R2 <- {mtcars} %>>>% 
  split(.$cyl) %>>>%
  lapply(function(data) lm(mpg ~ wt, data)) %>>>%
  lapply(summary) %>>>%
  sapply(`[[`, "r.squared")

## ------------------------------------------------------------------------
R2()

## ---- eval = FALSE-------------------------------------------------------
#  R2 <- constant(R2)
#  R2()
#  #>         4         6         8
#  #> 0.5086326 0.4645102 0.4229655
#  
#  # On a 2016 vintage laptop
#  microbenchmark::microbenchmark(R2(), times = 1e6)
#  #> Unit: nanoseconds
#  #>  expr min  lq     mean median  uq      max neval
#  #>  R2() 532 567 709.1435    585 647 39887308 1e+06

## ---- eval = FALSE-------------------------------------------------------
#  head(R2, 3)() %>% .[["6"]] %>% plot(2)

## ------------------------------------------------------------------------
size <- 5L

fn(x, ... ~ sample(x, !!size, ...))

## ------------------------------------------------------------------------
(draw <- partial(sample, size = !!size, replace = TRUE))

set.seed(2)
draw(letters)

## ------------------------------------------------------------------------
partial(partial(sample, replace = TRUE), size = 5L)

