library(hierfstat)


### Name: qn2.read.fstat
### Title: Read QuantiNemo extended format for genotype files
### Aliases: qn2.read.fstat

### ** Examples

dat<-qn2.read.fstat(system.file("extdata","qn2_sex.dat",package="hierfstat"))
  sexbias.test(dat[[1]],sex=dat[[2]])



