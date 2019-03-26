library(vbdm)


### Name: burdenPlot
### Title: plotting function for rare variant vbdm test
### Aliases: burdenPlot
### Keywords: vbdm association genetic rare variational plot

### ** Examples

#generate some test data
library(vbdm)
set.seed(1)
n <- 1000
m <- 30
G <- matrix(rbinom(n*m,2,.01),n,m);
beta1 <- rbinom(m,1,.2)
y <- G%*%beta1+rnorm(n,0,2)
res <- vbdm(y=y,G=G,scaling=FALSE);
bp<-burdenPlot(y=y,G=G,post=res$pvec,name.snp=1:30);







