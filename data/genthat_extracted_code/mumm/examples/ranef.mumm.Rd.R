library(mumm)


### Name: ranef.mumm
### Title: Extract Random Effects
### Aliases: ranef.mumm

### ** Examples

set.seed(100)
sigma_e <- 1.5
sigma_a <- 0.8
sigma_b <- 0.5
sigma_d <- 0.7
nu <- c(8.2, 6.2, 2.3, 10.4, 7.5, 1.9)

nA <- 15
nP <- 6
nR <- 5

a <- rnorm(nA, mean = 0, sd = sigma_a)
b <- rnorm(nA, mean = 0, sd = sigma_b)
d <- rnorm(nA*nP, mean = 0, sd = sigma_d)
e <- rnorm(nA*nP*nR, mean = 0, sd = sigma_e)

Assessor <- factor(rep(seq(1,nA),each = (nP*nR)))
Product <- factor(rep(rep(seq(1,nP),each = nR), nA))
AssessorProduct <- (Assessor:Product)

y <- nu[Product] + a[Assessor] + b[Assessor]*(nu[Product]-mean(nu)) + d[AssessorProduct] + e

sim_data <- data.frame(y, Assessor, Product)

fit <- mumm(y ~ 1 + Product + (1|Assessor) + (1|Assessor:Product) +
             mp(Assessor,Product) ,data = sim_data)

ranef(fit)




