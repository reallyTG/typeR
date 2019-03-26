library(BayesLCA)


### Name: blca.em
### Title: Bayesian Latent Class Analysis via an EM Algorithm
### Aliases: blca.em
### Keywords: em blca

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x <- rlca(1000, rbind(type1,type2), c(0.6,0.4))

fit <- blca.em(x, 2)
print(fit)
fit <- blca.em(x, 2, sd=TRUE) ##Returns posterior standard deviations
summary(fit)
plot(fit)

## Different starting values
fit <- blca.em(x, 2, start.vals="across")
xx <- data.blca(x)
fit <- blca.em(xx, 2, start.vals=sample(1:2, length(xx$counts) , replace=TRUE))



