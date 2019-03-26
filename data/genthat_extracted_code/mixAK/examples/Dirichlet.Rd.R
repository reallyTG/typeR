library(mixAK)


### Name: Dirichlet
### Title: Dirichlet distribution
### Aliases: Dirichlet rDirichlet C_rDirichlet_R

### ** Examples

set.seed(1977)

alpha <- c(1, 2, 3)
Mean <- alpha/sum(alpha)
Var <- -(alpha %*% t(alpha))
diag(Var) <- diag(Var) + alpha*sum(alpha)
Var <- Var/(sum(alpha)^2*(1+sum(alpha)))
x <- rDirichlet(1000, alpha=alpha)
x[1:5,]

apply(x, 1, sum)[1:5]           ### should be all ones
rbind(Mean, apply(x, 2, mean))

var(x)
print(Var)



