library(pirate)


### Name: data_generator
### Title: Functions for Simulating Data
### Aliases: data_generator data_generator1 data_generator2 data_generator3

### ** Examples

#constructing the covariance matrix
co <- matrix(0.2, 30, 30)
diag(co) <- 1
dataEx <- data_generator1(d = 0.3, R2 = 0.5, v2 = 1, n = 3000, 
                           co = co, beta1 = rep(1,30),inter = c(0,0))
#check the R squared of the simluated data set
dat <- dataEx[[1]]
summary(lm(V2~factor(trt)*(V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16+
V17+V18+V19+V20+V21+V22+V23+V24+V25+V26+V27+V28+V29+V30+V31+V32),data=dat))

bigData <- data_generator3(n = 10000,co = co,bet =dataEx[[2]], inter = c(0,0))



