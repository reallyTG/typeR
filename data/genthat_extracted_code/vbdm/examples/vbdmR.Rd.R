library(vbdm)


### Name: vbdmR
### Title: fit a discrete mixture model (R implementation)
### Aliases: vbdmR
### Keywords: vbdm association genetic rare variational

### ** Examples

#generate some test data
library(vbdm)
set.seed(3)
n <- 1000
m <- 20
G <- matrix(rbinom(n*m,2,.01),n,m);
beta1 <- rbinom(m,1,.2)
y <- G%*%beta1+rnorm(n,0,1.3)

#compare implementations
res1 <- vbdm(y=y,G=G);
res2 <- vbdmR(y=y,G=G);
T5 <- summary(lm(y~rowSums(scale(G))))$coef[2,4];
cat('vbdm p-value:',res1$p.value,
  '\nvbdmR p-value:',res2$p.value,
  '\nT5 p-value:',T5,'\n')
#vbdm p-value: 0.001345869 
#vbdmR p-value: 0.001345869 
#T5 p-value: 0.9481797 



