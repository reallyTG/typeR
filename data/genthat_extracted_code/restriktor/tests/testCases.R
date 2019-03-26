## test constrained lm, rlm, glm
# mixing weights
# bootstrap standard errors
# models with and without intercept
# case weights
# constraints on factors and interactions

library(restriktor)
n <- 100
p <- 4
betas = c(0.1,0.2,0.3,0.4,0.5)
set.seed(3013073)
X <- cbind(mvtnorm:::rmvnorm(n, mean=rep(0,p), sigma=diag(p)), rbinom(n,1,0.5))
colnames(X) <- c("x1","x2","x3","x4","f1")
z <- X %*% betas        
y <- z + rnorm(n)
DATA <- data.frame(y, X)

# intercept model
model1 <- y ~  1 + x1 + x2 + x3 + x4
# no intercept model
model2 <- y ~ -1 + x1 + x2 + x3 + x4
# intercept model with interaction
model3 <- y ~ 1 + x1*f1 + x2*f1 + x3*f1 + x4*f1
# intercept model with interaction
model4 <- y ~ -1 + x1*f1 + x2*f1 + x3*f1 + x4*f1

############################ lm #################################
linmod1 <- lm(model1, data = DATA)
linmod2 <- lm(model2, data = DATA)
linmod3 <- lm(model3, data = DATA)
linmod1wt <- lm(model1, data = DATA, weights = abs(rnorm(n)))
linmod2wt <- lm(model2, data = DATA, weights = abs(rnorm(n)))
linmod1fac <- lm(model3, data = DATA)
linmod2fac <- lm(model4, data = DATA)

constraints1 <- 'x1 > 0; x2 > 0; x3 > 0'
fit.restr1 <- restriktor(linmod1, constraints1)
fit.restr2 <- restriktor(linmod2, constraints1)
fit.restr3 <- restriktor(linmod3, constraints1)

## to do: add tests
