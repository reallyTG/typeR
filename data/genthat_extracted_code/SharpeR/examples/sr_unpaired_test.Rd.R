library(SharpeR)


### Name: sr_unpaired_test
### Title: test for equation on unpaired Sharpe ratios
### Aliases: sr_unpaired_test
### Keywords: htest

### ** Examples

# basic usage
set.seed(as.integer(charToRaw("set the seed")))
# default contrast is 1,-1,1,-1,1,-1
etc <- sr_unpaired_test(as.sr(matrix(rnorm(1000*6,mean=0.02,sd=0.1),ncol=6)))
print(etc)

etc <- sr_unpaired_test(as.sr(matrix(rnorm(1000*4,mean=0.0005,sd=0.01),ncol=4)),
  alternative='greater')
print(etc)

etc <- sr_unpaired_test(as.sr(matrix(rnorm(1000*4,mean=0.0005,sd=0.01),ncol=4)),
  contrasts=c(1,1,1,1),null.value=-0.1,alternative='greater')
print(etc)

inp <- list(as.sr(rnorm(500)),as.sr(runif(200)-0.5),
            as.sr(rnorm(30)),as.sr(rnorm(100)))
etc <- sr_unpaired_test(inp)

inp <- list(as.sr(rnorm(500)),as.sr(rnorm(100,mean=0.2,sd=1)))
etc <- sr_unpaired_test(inp,contrasts=c(1,1),null.value=0.2)
etc$conf.int




