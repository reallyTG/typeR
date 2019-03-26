library(mets)


### Name: pmvn
### Title: Multivariate normal distribution function
### Aliases: pmvn pbvn loglikMVN scoreMVN dmvn rmvn

### ** Examples

lower <- rbind(c(0,-Inf),c(-Inf,0))
upper <- rbind(c(Inf,0),c(0,Inf))
mu <- rbind(c(1,1),c(-1,1))
sigma <- diag(2)+1
pmvn(lower=lower,upper=upper,mu=mu,sigma=sigma)



