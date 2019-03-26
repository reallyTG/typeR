library(sfsmisc)


### Name: iterate.lin.recursion
### Title: Generate Sequence Iterating a Linear Recursion
### Aliases: iterate.lin.recursion
### Keywords: arith

### ** Examples

## The Fibonacci sequence:
iterate.lin.recursion(0:1, c(1,1), nr = 12)
## 0 1 1 2 3 5 8 13 21 34 55 89 144 233

## seq() as a special case:
stopifnot(iterate.lin.recursion(4,1, d=2, nr=20)
          == seq(4, by=2, length=1+20))

## ''Deterministic AR(2)'' :
round(iterate.lin.recursion(1:4, c(-0.7, 0.9), d = 2, nr=15), dig=3)
## slowly decaying :
plot(ts(iterate.lin.recursion(1:4, c(-0.9, 0.95), nr=150)))



