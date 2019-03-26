library(arm)


### Name: corrplot
### Title: Correlation Plot
### Aliases: corrplot
### Keywords: dplot

### ** Examples

old.par <- par(no.readonly = TRUE)

 x1 <- rnorm(1000,50,2) 
 x2 <- rbinom(1000,1,prob=0.63) 
 x3 <- rpois(1000, 2) 
 x4 <- runif(1000,40,100) 
 x5 <- rnorm(1000,100,30)
 x6 <- rbeta(1000,2,2) 
 x7 <- rpois(1000,10) 
 x8 <- rbinom(1000,1,prob=0.4) 
 x9 <- rbeta(1000,5,4) 
 x10 <- runif(1000,-10,-1) 

 test.data <- data.matrix(cbind(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10))
 test.names <- c("a short name01","a short name02","a short name03",
                 "a short name04","a short name05","a short name06",
                 "a short name07","a short name08","a short name09",
                 "a short name10")
 
 # example 1
 corrplot(test.data)
 
 # example 2
 corrplot(test.data,test.names, abs=FALSE, n.col.legend=7)
 corrplot(test.data,test.names, abs=TRUE, n.col.legend=7)
 
 # example 3
 data(lalonde)
 corrplot(lalonde, details=FALSE, color=TRUE)
 corrplot(lalonde, cutpts=c(0,0.25,0.5,0.75), color=TRUE, digits=2)
 
par(old.par)



