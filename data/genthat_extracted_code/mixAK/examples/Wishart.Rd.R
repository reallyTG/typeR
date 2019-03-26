library(mixAK)


### Name: Wishart
### Title: Wishart distribution
### Aliases: Wishart dWISHART rWISHART C_rWishart_R C_ldWishart_R
### Keywords: distribution multivariate

### ** Examples

set.seed(1977)
### The same as gamma(shape=df/2, rate=1/(2*S))
df <- 1
S  <- 3

w <- rWISHART(n=1000, df=df, S=S)
mean(w)    ## should be close to df*S
var(w)     ## should be close to 2*df*S^2

dWISHART(w[1], df=df, S=S)
dWISHART(w[1], df=df, S=S, log=TRUE)

dens.w <- dWISHART(w, df=df, S=S)
dens.wG <- dgamma(w, shape=df/2, rate=1/(2*S))
rbind(dens.w[1:10], dens.wG[1:10])

ldens.w <- dWISHART(w, df=df, S=S, log=TRUE)
ldens.wG <- dgamma(w, shape=df/2, rate=1/(2*S), log=TRUE)
rbind(ldens.w[1:10], ldens.wG[1:10])


### Bivariate Wishart
df <- 2
S <- matrix(c(1,3,3,13), nrow=2)

print(w2a <- rWISHART(n=1, df=df, S=S))
dWISHART(w2a, df=df, S=S)

w2 <- rWISHART(n=1000, df=df, S=S)
print(w2[1:10,])
apply(w2, 2, mean)                ## should be close to df*S
(df*S)[lower.tri(S, diag=TRUE)]

dens.w2 <- dWISHART(w2, df=df, S=S)
ldens.w2 <- dWISHART(w2, df=df, S=S, log=TRUE)
cbind(w2[1:10,], data.frame(Density=dens.w2[1:10], Log.Density=ldens.w2[1:10]))


### Trivariate Wishart
df <- 3.5
S <- matrix(c(1,2,3,2,20,26,3,26,70), nrow=3)

print(w3a <- rWISHART(n=1, df=df, S=S))
dWISHART(w3a, df=df, S=S)

w3 <- rWISHART(n=1000, df=df, S=S)
print(w3[1:10,])
apply(w3, 2, mean)                ## should be close to df*S
(df*S)[lower.tri(S, diag=TRUE)]

dens.w3 <- dWISHART(w3, df=df, S=S)
ldens.w3 <- dWISHART(w3, df=df, S=S, log=TRUE)
cbind(w3[1:10,], data.frame(Density=dens.w3[1:10], Log.Density=ldens.w3[1:10]))



