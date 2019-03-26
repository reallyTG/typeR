## ----setup, echo = FALSE, message = FALSE--------------------------------
library(hedgehog)
set.seed(1014)

## ----echo = T, message = F-----------------------------------------------
test_that( "Reverse of reverse is identity",
  forall( gen.c( gen.element(1:100) ), function(xs) expect_equal(rev(rev(xs)), xs))
)

## ----echo = T, message = F-----------------------------------------------
test_that( "Reversed of concatenation is flipped concatenation of reversed",
  forall( list( as = gen.c( gen.element(1:100) )
              , bs = gen.c( gen.element(1:100) ))
        , function(as,bs) expect_equal ( rev(c(as, bs)), c(rev(bs), rev(as)))
  )
)

## ----echo = T, message = F, error=TRUE-----------------------------------
test_that( "Reverse is identity",
  forall( gen.c( gen.element(1:100) ), function(xs) expect_equal(rev(xs), c(xs)))
)

## ----echo = T, message = F-----------------------------------------------
gen.sample(1:5)

## ----echo = T, message = F, error=TRUE-----------------------------------
test_that( "a is less than b + 1",
    forall(list(a = gen.element(1:100), b = gen.unif(1,100, shrink.median = F))
  , function(a, b) expect_lt( a, b + 1 ))
)

## ----echo = T, message = F-----------------------------------------------
gen.df.of <- function ( n )
  gen.with (
    list( as = gen.c(of = n, gen.element(1:10) )
        , bs = gen.c(of = n, gen.element(10:20) )
        )
  , as.data.frame
  )

test_that( "Number of rows is 5",
  forall( gen.df.of(5), function(df) expect_equal(nrow(df), 5))
)

## ----echo = T, message = F, error=TRUE-----------------------------------
gen.df <-
  generate(for (e in gen.element(1:100)) {
    gen.df.of(e)
  })

test_that( "All data frames are of length 1",
  forall( gen.df, function(x) expect_equal(nrow(x), 1))
)

