library(vbdm)


### Name: vbdm
### Title: fit a discrete mixture model
### Aliases: vbdm
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

#with scaling:
res <- vbdm(y=y,G=G);
T5 <- summary(lm(y~rowSums(scale(G))))$coef[2,4];
cat('vbdm p-value:',res$p.value,'\nT5 p-value:',T5,'\n')
#vbdm p-value: 0.001345869 
#T5 p-value: 0.9481797 

#without scaling:
res <- vbdm(y=y,G=G,scaling=FALSE)
T5 <- summary(lm(y~rowSums(G)))$coef[2,4];
cat('vbdm p-value:',res$p.value,'\nT5 p-value:',T5,'\n')
#vbdm p-value: 0.0005315836 
#T5 p-value: 0.904476 

#run 100 permutations
set.seed(2)
res <- vbdm(y=y,G=G,scaling=FALSE,nperm=1e2);
cat('vbdm approximate p-value:',res$p.value,'\nvbdm permutation p-value <',res$p.value.perm,'\n');
#vbdm approximate p-value: 0.0005315836 
#vbdm permutation p-value: 0 



