library(sensR)


### Name: discrimPwr
### Title: Sensory discrimination power analysis
### Aliases: discrimPwr d.primePwr
### Keywords: models

### ** Examples

## Finding the power of a discrimination test with d-prime = 1,
## a sample of size 30 and a type I level of .05:
pd <- coef(rescale(d.prime = 1, method = "twoAFC"))$pd
discrimPwr(pd, sample.size = 30)
d.primePwr(1, sample.size = 30, method = "twoAFC")
## Obtaining the equivalent normal approximation with and without
## continuity correction:
discrimPwr(pd, sample.size = 30, statistic = "cont.normal")
discrimPwr(pd, sample.size = 30, statistic = "normal")

# Example from Bi (2001) with n=100 and 35 correct answers in a 
# double duotrio test:
p1 <- 0.35
# Estimate of d-prime quoted by Bi(2001) was 1.06:
dp <- psyinv(p1, method="duotrio", double=TRUE) 
# Power using normal approximation w/o continuity adjustment quoted by Bi(2001):
d.primePwr(dp, sample.size = 100, method="duotrio", 
           double=TRUE, stat="normal") # 0.73
# d.primePwr(dp, sample.size = 100, method="duotrio", double=TRUE, 
#            stat="cont.normal")

# Power of exact test:
d.primePwr(dp, sample.size = 100, method="duotrio", 
           double=TRUE, stat="exact") # 0.697

## A similarity example:
discrimPwr(pdA = 0.1, pd0 = 0.2, sample.size = 100, pGuess = 1/3,
           test = "similarity")
## Don't show: 
## Testing stability of results:
x1 <- discrimPwr(pd, sample.size = 30)
x2 <- d.primePwr(1, sample.size = 30, method = "twoAFC")
## x3 := dput(x2)
x3 <- 0.917255217993622
stopifnot(isTRUE(all.equal(x1, x2, x3)))

y1 <- discrimPwr(pd, sample.size = 30, statistic = "cont.normal")
y2 <- discrimPwr(pd, sample.size = 30, statistic = "normal")
y3 <- discrimPwr(pdA = 0.1, pd0 = 0.2, sample.size = 100, pGuess = 1/3,
           test = "similarity")
y <- c(y1, y2, y3)
## yres := dput(y)
yres <- c(0.88466478871626, 0.921092040377824, 0.306809762270984)
stopifnot(isTRUE(all.equal(y, yres)))

# Check examples from Bi (2001):
p1 <- 0.35
stopifnot(
  all.equal(psyinv(p1, method="duotrio", double=TRUE), 1.06082607037307),
  all.equal(d.primePwr(dp, sample.size = 100, method="duotrio", 
                       double=TRUE, stat="normal"), 0.726811262989353),
  all.equal(d.primePwr(dp, sample.size = 100, method="duotrio", 
           double=TRUE, stat="exact"), 0.697083711530984))
## End(Don't show)




