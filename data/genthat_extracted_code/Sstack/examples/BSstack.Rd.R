library(Sstack)


### Name: BSstack
### Title: Bootstrap Stacking model builder.
### Aliases: BSstack

### ** Examples

library(Sstack)
library(doParallel)
data(StackData)

AUC=StackData[[1]]
GE=StackData[[2]]
RPPA=StackData[[3]]

X1 <- GE[1:400,1:75]
X2 <- GE[200:400,76:150]
Xt <- GE[401:487,]

set.seed(1)

cl <- makeCluster(2)
registerDoParallel(cl)

Hbs <- BSstack(T = 25, iter = 20, Y = AUC, X1 = X1, X2 = X2)

stopCluster(cl)

Yp <- BSstack_predict(Hbs[[1]],Xt)

maeH1 <- mean(abs(AUC[401:487,]-Yp[,1]))
maeH2 <- mean(abs(AUC[401:487,]-Yp[,2]))
maeHs <- mean(abs(AUC[401:487,]-Yp[,3]))



