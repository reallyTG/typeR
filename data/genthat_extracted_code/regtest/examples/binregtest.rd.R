library(regtest)


### Name: binregtest
### Title: Binary regression test
### Aliases: binregtest
### Keywords: debugging documentation

### ** Examples

wronglog <- function(x, base=exp(1)){
  if (x>0)
    log(x, base=base)
  else
    NA
}
binregtest(wronglog, log, x=as.list(0:3), base=list(2, exp(1), 10))



