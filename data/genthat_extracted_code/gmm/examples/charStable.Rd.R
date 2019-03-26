library(gmm)


### Name: charStable
### Title: The characteristic function of a stable distribution
### Aliases: charStable

### ** Examples


# GMM is like GLS for linear models without endogeneity problems

pm <- 0
theta <- c(1.5,.5,1,0) 
tau <- seq(-3, 3, length.out = 20)
char_fct <- charStable(theta, tau, pm)




