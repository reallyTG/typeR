library(gdata)


### Name: wideByFactor
### Title: Create multivariate data by a given factor
### Aliases: wideByFactor
### Keywords: manip misc

### ** Examples

n <- 10
f <- 2
tmp <- data.frame(y1=rnorm(n=n),
                  y2=rnorm(n=n),
                  f1=factor(rep(letters[1:f], n/2)),
                  f2=factor(c(rep(c("M"), n/2), rep(c("F"), n/2))),
                  c1=1:n,
                  c2=2*(1:n))

wideByFactor(x=tmp, factor="f1", common=c("c1", "c2", "f2"))
wideByFactor(x=tmp, factor="f1", common=c("c1", "c2"))



