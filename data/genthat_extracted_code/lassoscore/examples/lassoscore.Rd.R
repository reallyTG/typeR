library(lassoscore)


### Name: lassoscore
### Title: Lasso penalized score test
### Aliases: lassoscore lassoscore-package

### ** Examples

#Simulation from Voorman et al (2014)
set.seed(20)
n <- 300
p <- 100
q <- 10

set.seed(20)
beta <- numeric(p)
beta[sample(p,q)] <- 0.4

Sigma <- forceSymmetric(t(0.5^outer(1:p,1:p,"-")))
cSigma <- chol(Sigma)

x <- scale(replicate(p,rnorm(n))%*%cSigma)
y <- rnorm(n,x%*%beta,1)

mod <- lassoscore(y,x,0.02)
summary(mod)
plot(mod,type="all")

#test only features 10:20:
mod0 <- lassoscore(y,x,0.02, subset = 10:20)

######## Diabetes data set:
#Test features in the diabetes data set, using 2 different values of `lambda', 
#and compare results:
resvar <- with(lm(y~x,data=diabetes), sum(residuals^2)/df.residual)

mod2 <- with(diabetes,lassoscore(y,x,lambda=4,resvar=resvar))
mod3 <- with(diabetes,lassoscore(y,x,lambda=0.5,resvar=resvar))
data.frame(
  "variable"=colnames(diabetes$x),
  "lambda_4"=format(mod2$p.model,digits=2),
  "lambda_0.5"=format(mod3$p.model,digits=2))



