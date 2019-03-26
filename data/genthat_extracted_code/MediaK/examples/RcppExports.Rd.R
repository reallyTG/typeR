library(MediaK)


### Name: RcppExports
### Title: Set of functions in example RcppEigen package
### Aliases: dis_value permute

### ** Examples


iTest <- matrix(rnorm(1000),100)
jTest<- matrix(rnorm(200),100)
select<- 5
times<- 100
selectvec <- c(1:10)
dis_value(iTest,jTest,select)
permute(iTest,jTest,times,selectvec)





