library(ivtools)


### Name: ivbounds
### Title: Bounds for counterfactual outcome probabilities in instrumental
###   variables scenarios
### Aliases: ivbounds

### ** Examples


##Vitamin A example from Balke and Pearl (1997).
n000 <- 74
n001 <- 34
n010 <- 0
n011 <- 12
n100 <- 11514
n101 <- 2385
n110 <- 0
n111 <- 9663
n0 <- n000+n010+n100+n110
n1 <- n001+n011+n101+n111

#with data frame...
data <- data.frame(Y=c(0,0,0,0,1,1,1,1), X=c(0,0,1,1,0,0,1,1), 
  Z=c(0,1,0,1,0,1,0,1))
n <- c(n000, n001, n010, n011, n100, n101, n110, n111)
b <- ivbounds(data=data, Z="Z", X="X", Y="Y", weights=n)
summary(b)

#...or with vector of probabilities
p <- n/rep(c(n0, n1), 4)
names(p) <- c("p00.0", "p00.1", "p01.0", "p01.1", 
  "p10.0", "p10.1", "p11.0", "p11.1") 
b <- ivbounds(data=p)
summary(b)






