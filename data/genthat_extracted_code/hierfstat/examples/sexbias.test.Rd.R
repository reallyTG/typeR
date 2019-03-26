library(hierfstat)


### Name: sexbias.test
### Title: Test for sex biased dispersal
### Aliases: sexbias.test

### ** Examples

data(crocrussula)
  sexbias.test(crocrussula$genot,crocrussula$sex)
  dat<-qn2.read.fstat(system.file("extdata","qn2_sex.dat",package="hierfstat"))
  sexbias.test(dat[[1]],sex=dat[[2]])
  ## Not run: 
##D   sexbias.test(crocrussula$genot,crocrussula$sex,nperm=1000)
##D   sexbias.test(dat[[1]],sex=dat[[2]],nperm=100,test="FST",alternative="greater")
##D   
## End(Not run)



