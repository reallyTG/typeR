library(RAMP)


### Name: RAMP
### Title: Regularization Algorithm under Marginality Principle (RAMP) for
###   high dimensional generalized quadratic regression.
### Aliases: RAMP

### ** Examples

set.seed(0)
n = 500
p = 10 #Can be changed to a much larger number say 50000
x = matrix(rnorm(n*p),n,p)
eta = 1 * x[,1] + 2 * x[,3]  + 3*x[,6]  + 4*x[,1]*x[,3] + 5*x[,1]*x[,6]
y =  eta + rnorm(n)
xtest = matrix(rnorm(n*p),n,p)
eta.test = 1 * xtest[,1] + 2 * xtest[,3]  + 3*xtest[,6] +
4*xtest[,1]*xtest[,3] + 5*xtest[,1]*xtest[,6]
ytest =  eta.test + rnorm(n)
fit1 = RAMP(x, y)
fit1    ###examine the results
ypred = predict(fit1, xtest)
mean((ypred-ytest)^2)

#fit1.scad = RAMP(x, y, penalty = 'SCAD')
#fit1.scad    ###examine the results

#fit1.mcp = RAMP(x, y, penalty = 'MCP')
#fit1.mcp    ###examine the results

##Now, try a binary response
#y = rbinom(n, 1, 1/(1+exp(-eta)))
#fit2 = RAMP(x, y, family='binomial')  ###for binary response

## Weak heredity
eta = 1 * x[,1] + 3*x[,6]  + 4*x[,1]*x[,3] + 5*x[,1]*x[,6]
y =  eta + rnorm(n)
eta.test = 1 * xtest[,1] +  3*xtest[,6] + 4*xtest[,1]*xtest[,3] +
5*xtest[,1]*xtest[,6]
ytest =  eta.test + rnorm(n)

fit3 = RAMP(x, y, hier = 'Strong')
fit3    ###examine the results
ypred3 = predict(fit3, xtest)
mean((ypred3-ytest)^2)
fit4 = RAMP(x, y, hier = 'Weak')
fit4
ypred4 = predict(fit4, xtest)
mean((ypred4-ytest)^2)



