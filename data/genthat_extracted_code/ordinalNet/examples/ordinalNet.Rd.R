library(ordinalNet)


### Name: ordinalNet
### Title: Ordinal regression models with elastic net penalty
### Aliases: ordinalNet

### ** Examples

# Simulate x as independent standard normal
# Simulate y|x from a parallel cumulative logit (proportional odds) model
set.seed(1)
n <- 50
intercepts <- c(-1, 1)
beta <- c(1, 1, 0, 0, 0)
ncat <- length(intercepts) + 1  # number of response categories
p <- length(beta)  # number of covariates
x <- matrix(rnorm(n*p), ncol=p)  # n x p covariate matrix
eta <- c(x %*% beta) + matrix(intercepts, nrow=n, ncol=ncat-1, byrow=TRUE)
invlogit <- function(x) 1 / (1+exp(-x))
cumprob <- t(apply(eta, 1, invlogit))
prob <- cbind(cumprob, 1) - cbind(0, cumprob)
yint <- apply(prob, 1, function(p) sample(1:ncat, size=1, prob=p))
y <- as.factor(yint)

# Fit parallel cumulative logit model
fit1 <- ordinalNet(x, y, family="cumulative", link="logit",
                   parallelTerms=TRUE, nonparallelTerms=FALSE)
summary(fit1)
coef(fit1)
coef(fit1, matrix=TRUE)
predict(fit1, type="response")
predict(fit1, type="class")

# Fit nonparallel cumulative logit model
fit2 <- ordinalNet(x, y, family="cumulative", link="logit",
                   parallelTerms=FALSE, nonparallelTerms=TRUE)
fit2
coef(fit2)
coef(fit2, matrix=TRUE)
predict(fit2, type="response")
predict(fit2, type="class")

# Fit semi-parallel cumulative logit model (with both parallel and nonparallel terms)
fit3 <- ordinalNet(x, y, family="cumulative", link="logit",
                   parallelTerms=TRUE, nonparallelTerms=TRUE)
fit3
coef(fit3)
coef(fit3, matrix=TRUE)
predict(fit3, type="response")
predict(fit3, type="class")




