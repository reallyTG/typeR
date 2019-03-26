library(robustbase)


### Name: lmrob.control
### Title: Tuning Parameters for lmrob() and Auxiliaries
### Aliases: lmrob.control lmrob.control .Mchi.tuning.default
###   .Mpsi.tuning.default .Mchi.tuning.defaults .Mpsi.tuning.defaults
### Keywords: robust regression

### ** Examples

## Show the default settings:
str(lmrob.control())

## Artificial data for a  simple  "robust t test":
set.seed(17)
y <- y0 <- rnorm(200)
y[sample(200,20)] <- 100*rnorm(20)
gr <- as.factor(rbinom(200, 1, prob = 1/8))
lmrob(y0 ~ 0+gr)

## Use  Koller & Stahel(2011)'s recommendation but a larger  'max.it':
str(ctrl <- lmrob.control("KS2011", max.it = 1000))

str(.Mpsi.tuning.defaults)
stopifnot(identical(.Mpsi.tuning.defaults,
                   sapply(names(.Mpsi.tuning.defaults),
                          .Mpsi.tuning.default)))
## Containing (names!) all our (pre-defined) redescenders:
str(.Mchi.tuning.defaults)

## Difference between settings:
C11 <- lmrob.control("KS2011")
C14 <- lmrob.control("KS2014")
str(C14)
## Apart from `setting` itself, they only differ in three places:
diffC <- names(which(!mapply(identical, C11,C14, ignore.environment=TRUE)))
cbind(KS11 = unlist(C11[diffC[-1]]),
      KS14 = unlist(C14[diffC[-1]]))
##           KS11 KS14
## nResample  500 1000
## best.r.s     2   20
## k.fast.s     1    2



