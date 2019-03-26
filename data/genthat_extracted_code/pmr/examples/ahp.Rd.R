library(pmr)


### Name: ahp
### Title: The Analytic hierarchy process (AHP)
### Aliases: ahp
### Keywords: Analytic hierarchy process

### ** Examples

## create an artificial A matrix abc, example taken from Koczkodaj et al. (1997)
abc <- matrix(data = 1:16, nrow = 4, ncol = 4, byrow = TRUE)
abc[1,1] <- 1
abc[1,2] <- 2
abc[1,3] <- 5
abc[1,4] <- 4
abc[2,1] <- 1/2
abc[2,2] <- 1
abc[2,3] <- 3
abc[2,4] <- 1.9
abc[3,1] <- 1/5
abc[3,2] <- 1/3
abc[3,3] <- 1
abc[3,4] <- 0.7
abc[4,1] <- 1/4
abc[4,2] <- 1/1.9
abc[4,3] <- 1/0.7
abc[4,4] <- 1

## compute the weights, Saaty's and Koczkodaj's inconsistencies
## ahp(abc)



