library(ibdreg)


### Name: lsConstrain.fit
### Title: Minimize Inequality Constrained Mahalanobis Distance
### Aliases: lsConstrain.fit

### ** Examples

# An simulation example with linear regression with 3 beta's, 
# where we have the contraints:
#
# b[1] > 0
# b[2] - b[1] < 0
# b[3] < 0


set.seed(111)

n <- 100
x <- rep(1:3,rep(n,3))
x <- 1*outer(x,1:3,"==")

beta <- c(2,1,1)

y <- x%*%beta + rnorm(nrow(x))

fit <- lm(y ~-1 + x)

s <- solve( t(x) %*% x )

bhat <- fit$coef


a <-  rbind(c(-1, 0, 0),
            c(-1, 1, 0),
            c( 0, 0, 1))

# View expected constraints (3rd not met):

a %*% bhat
#            [,1] 
# [1,] -1.8506811
# [2,] -0.9543320
# [3,]  0.8590827

b <- rep(0, nrow(a))
iflag <- rep(0,length(b))

save <- lsConstrain.fit(x=bhat,b=b, s=s, a=a, iflag=iflag, itmax=500, 
                        eps=1e-6, eps2=1e-6)

save



