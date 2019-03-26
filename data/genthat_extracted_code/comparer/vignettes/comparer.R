## ----setup, echo=FALSE---------------------------------------------------
set.seed(0)

## ------------------------------------------------------------------------
if (requireNamespace("microbenchmark", quietly = TRUE)) {
  x <- runif(100)
  microbenchmark::microbenchmark(sqrt(x), x ^ .5)
} else {
  "microbenchmark not available on your computer"
}

## ------------------------------------------------------------------------
library(comparer)
mbc(mean(rnorm(10)), mean(rnorm(100)))

## ------------------------------------------------------------------------
mbc(mean(rnorm(10)), mean(rnorm(100)), times=100)

## ------------------------------------------------------------------------
mbc(mean(x), median(x), input=list(x=rexp(30)))

## ------------------------------------------------------------------------
mbc(mean(x), median(x), inputi={x=rexp(30)})

## ------------------------------------------------------------------------
mbc(mean, median, inputi=rexp(30))

## ------------------------------------------------------------------------
n <- 20
x <- seq(0, 1, length.out = n)
y <- 1.8 * x - .6
ynoise <- y + rnorm(n, 0, .2)

## ------------------------------------------------------------------------
mbc(predict(lm(ynoise ~ x), data.frame(x)),
    predict(lm(ynoise ~ x - 1), data.frame(x)),
    target = y)

## ------------------------------------------------------------------------
mbc(predict(lm(ynoise ~ x), data.frame(x)),
    predict(lm(ynoise ~ x - 1), data.frame(x)),
    inputi={ynoise <- y + rnorm(n, 0, .2)},
    target = y)

## ------------------------------------------------------------------------
mbc(ynoise ~ x,
    ynoise ~ x - 1,
    evaluator=predict(lm(.), data.frame(x)),
    inputi={ynoise <- y + rnorm(n, 0, .2)},
    target = y)

## ----kfold_cars_ex-------------------------------------------------------
mbc({mod <- lm(dist ~ speed, data=cars[ki,])
     p <- predict(mod,cars[-ki,])
     sqrt(mean((p - cars$dist[-ki])^2))
     },
    kfold=c(nrow(cars), 5),
    times=30)

## ----kfold_cars_ex2------------------------------------------------------
mbc(lm(dist ~ speed, data=cars[ki,]),
    targetin=cars[-ki,], target="dist",
    kfold=c(nrow(cars), 5),
    times=30)

## ----kfold_cars_metric_t-------------------------------------------------
mbc(lm(dist ~ speed, data=cars[ki,]),
    targetin=cars[-ki,], target="dist",
    kfold=c(nrow(cars), 5),
    times=30,
    metric='t')

