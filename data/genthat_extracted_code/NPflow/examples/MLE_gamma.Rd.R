library(NPflow)


### Name: MLE_gamma
### Title: MLE for Gamma distribution
### Aliases: MLE_gamma

### ** Examples


g_list <- list()
for(i in 1:1000){
 g_list <- c(g_list, rgamma(1, shape=100, rate=5))
}

mle <- MLE_gamma(g_list)
mle




