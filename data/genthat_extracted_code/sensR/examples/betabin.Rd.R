library(sensR)


### Name: betabin
### Title: Beta-binomial and chance-corrected beta-binomial models for
###   over-dispersed binomial data
### Aliases: betabin summary.betabin
### Keywords: models

### ** Examples

## Create data:
x <- c(3,2,6,8,3,4,6,0,9,9,0,2,1,2,8,9,5,7)
n <- c(10,9,8,9,8,6,9,10,10,10,9,9,10,10,10,10,9,10)
dat <- data.frame(x, n)

## Chance corrected beta-binomial model:
(bb0 <- betabin(dat, method = "duotrio"))
summary(bb0)
## Un-corrected beta-binomial model:
(bb <- betabin(dat, corrected = FALSE, method = "duotrio"))
summary(bb)
vcov(bb)
logLik(bb)
AIC(bb)
coef(bb)
## Don't show: 
## Testing:
## Chance corrected model:
x <- as.vector(coef(summary(bb0)))
## x2 := dput(x)
x2 <- c(0.176050917183022, 0.504272625540766, 0.588025458591511, 0.176050917183022,
1.03723538712345, 0.0827416835966564, 0.166754897796229, 0.0413708417983282,
0.0827416835966564, 0.274652313643027, 0.0138801973133669, 0.177439031614499,
0.506940098656683, 0.0138801973133669, 0.276003094947466, 0.338221637052677,
0.831106219467033, 0.669110818526339, 0.338221637052677,
1.53322252140796)

stopifnot(isTRUE(all.equal(x, x2)))

## Un-corrected model:
x <- as.vector(coef(summary(bb)))
## x2 := dput(x)
x2 <- c(0.493812345858779, 0.31442578341548, 0.5, 0, 0, 0.0723816596143461,
0.0861846136283124, NA, NA, NA, 0.351946899873424, 0.145507044682488,
0.5, 0, 0, 0.635677791844135, 0.483344522148472, 0.635677791844135,
0.27135558368827, 1.33527484290736)
stopifnot(isTRUE(all.equal(x, x2)))
## End(Don't show)



