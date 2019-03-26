library(PACBO)


### Name: PACBO
### Title: PACBO
### Aliases: PACBO

### ** Examples

## generating 4 clusters of 100 points in \strong{R}^{5}.
set.seed(100)
Nb <- 4
d <- 5
T <- 100
proportion = rep(1/Nb, Nb)
Mean_vectors <- matrix(runif(d*Nb,min=-10, max=10),nrow=Nb,ncol=d, byrow=TRUE)
mydata <- matrix(replicate(T, rmnorm(1, mean= Mean_vectors[sample(1:Nb, 1, prob = proportion),],
varcov = diag(1,d))), nrow = T, byrow=T)
R <- max(sqrt(rowSums(mydata^2)))
##run the algorithm.
result <- PACBO(mydata, R, plot_ind = TRUE)



