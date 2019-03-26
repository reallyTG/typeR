library(BurStMisc)


### Name: genopt.control
### Title: Control parameters for genopt
### Aliases: genopt.control
### Keywords: optimize

### ** Examples

  goc1 <- genopt.control(random.n=200, births=1000, trace=FALSE)

  go1 <- genopt(function(x, other) sum(x, other),
                matrix(rexp(10), nrow=2, ncol=5), lower=0, add.arg=list(other=3),
                control=goc1)

  goc2 <- genopt.control(random.n=0, births=1000, trace=FALSE)

  go2 <- genopt(function(x, other) sum(x, other), go1,
                lower=0, add.arg=list(other=3), control=goc2)




