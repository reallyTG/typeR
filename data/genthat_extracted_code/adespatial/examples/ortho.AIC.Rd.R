library(adespatial)


### Name: ortho.AIC
### Title: Compute AIC for models with orthonormal explanatory variables
### Aliases: ortho.AIC
### Keywords: models

### ** Examples


y <- matrix(rnorm(50),50,1)
x <- svd(scale(y %*% c(0.1,0.5,2,0,0.7)+matrix(rnorm(250),50,5)))$u
res <- ortho.AIC(y,x,ord.var=TRUE)
minAIC <- which.min(res$AICc)
nvar <- length(1:minAIC)+1 # number of orthogonal vectors + 1 for intercept
lm1 <- lm(y~x[,res$ord[1:minAIC]])
summary(lm1)$r.squared # R2
res$R2[minAIC] # the same
min(res$AICc) # corrected AIC
extractAIC(lm1) # classical AIC
min(res$AICc)-2*(nvar*(nvar+1))/(nrow(x)-nvar-1) # the same

lm2 <- lm(y~1)

res$AICc0 # corrected AIC for the null model
extractAIC(lm2) # classical AIC
res$AICc0-2*(1*(1+1))/(nrow(x)-1-1) # the same




