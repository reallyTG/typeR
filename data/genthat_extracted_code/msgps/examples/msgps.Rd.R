library(msgps)


### Name: msgps
### Title: msgps (Model Selection Criteria via Generalized Path Seeking)
### Aliases: msgps dfgps aicc.dfgps bic.dfgps cp.dfgps gcv.dfgps
###   print.msgps
### Keywords: models

### ** Examples

#data
X <- matrix(rnorm(100*8),100,8)
beta0 <- c(3,1.5,0,0,2,0,0,0)
epsilon <- rnorm(100,sd=3)
y <- X %*% beta0 + epsilon
y <- c(y)

#lasso
fit <- msgps(X,y)
summary(fit) 
coef(fit) #extract coefficients at t selected by model selection criteria
coef(fit,c(0, 0.5, 2.5)) #extract coefficients at some values of t
predict(fit,X[1:10,]) #predict values at t selected by model selection criteria
predict(fit,X[1:10,],c(0, 0.5, 2.5)) #predict values at some values of t
plot(fit,criterion="cp") #plot the solution path with a model selected by Cp criterion

#elastic net
fit2 <- msgps(X,y,penalty="enet",alpha=0.5)
summary(fit2) 

#generalized elastic net
fit3 <- msgps(X,y,penalty="genet",alpha=0.5)
summary(fit3)

#adaptive lasso
fit4 <- msgps(X,y,penalty="alasso",gamma=1,lambda=0)
summary(fit4)



