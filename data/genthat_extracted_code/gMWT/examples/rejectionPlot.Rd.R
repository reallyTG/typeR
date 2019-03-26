library(gMWT)


### Name: rejectionPlot
### Title: Creates a Rejection Plot.
### Aliases: rejectionPlot
### Keywords: methods

### ** Examples

X <- matrix(c(rnorm(50,2,1),rnorm(60,2,1),rnorm(40,2.5,1)),byrow=TRUE, ncol=10)
colnames(X) <- letters[1:10]
g <- c(rep(1,5),rep(2,6),rep(3,4))


test1 <- gmw(X,g,test="mw",type="external",alternative="greater",goi=c(2,3))
test2 <- gmw(X,g,test="kw",type="external")
test3 <- gmw(X,g,test="jt",type="external",alternative="greater")

tests <- rbind(test1$p.values,test2$p.values,test3$p.values)

rejectionPlot(tests,lCol=c("green","red","blue"))



