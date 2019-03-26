library(NPflow)


### Name: similarityMat_nocostC
### Title: C++ implementation
### Aliases: similarityMat_nocostC

### ** Examples

c <- list(c(1,1,2,3,2,3), c(1,1,1,2,3,3),c(2,2,1,1,1,1))
similarityMat_nocostC(sapply(c, "["))

c2 <- list()
for(i in 1:10){
    c2 <- c(c2, list(rmultinom(n=1, size=1000, prob=rexp(n=1000))))
}

c3 <- sapply(c2, "[")

if(require(microbenchmark)){
library(microbenchmark)
microbenchmark(similarityMat(c3), similarityMat_nocostC(c3), times=2L)
}else{
cat("package 'microbenchmark' not available\n")
}



