library(stm)


### Name: makeDesignMatrix
### Title: Make a Design Matrix
### Aliases: makeDesignMatrix
### Keywords: internal

### ** Examples

foo <- data.frame(response=rnorm(30),
                  predictor=as.factor(rep(c("A","B","C"),10)), 
                  predictor2=rnorm(30))
foo.new <- data.frame(predictor=as.factor(c("A","C","C")), 
                      predictor2=foo$predictor2[1:3])
makeDesignMatrix(~predictor + s(predictor2), foo, foo.new)



