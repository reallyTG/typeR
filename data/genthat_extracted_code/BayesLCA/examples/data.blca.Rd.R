library(BayesLCA)


### Name: data.blca
### Title: Conveniently Format Data for Bayesian Latent Class
### Aliases: data.blca
### Keywords: blca data.blca

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4)) ##Only 16 unique observations possible

data.blca(x)



