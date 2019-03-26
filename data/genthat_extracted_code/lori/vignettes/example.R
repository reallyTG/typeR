## ----data-example--------------------------------------------------------
library(lori)
library(glmnet)
library(gridExtra)
data("aravo")

## ----create-covariate-matrix---------------------------------------------
# Environment characteristics
head(aravo$env)

# Species traits
head(aravo$traits)

d <- dim(aravo$spe)
n <- d[1]
p <- d[2]

# Create covariate matrix, choose quantitative variables in Row and Column covariates
# and use covmat function to replicate species/environments
# center and scale covariate matrix
cov <- scale(covmat(aravo$env[, c(1,2,4,6)], aravo$traits, n, p))

## ----apply-lori----------------------------------------------------------
lambda1 <- qut(aravo$spe, cov)
res <- lori(aravo$spe, cov, lambda1=lambda1, lambda2=0, trace.it = T)
res$alpha
plot(svd(res$theta)$d)

