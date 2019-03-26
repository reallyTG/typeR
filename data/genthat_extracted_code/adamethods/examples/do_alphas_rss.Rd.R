library(adamethods)


### Name: do_alphas_rss
### Title: Alphas and RSS of every set of archetypoids
### Aliases: do_alphas_rss

### ** Examples

data(mtcars)
data <- mtcars
n <- nrow(data)
m <- 10

k <- 3 
numRep <- 2
huge <- 200

set.seed(1)
rand_obs_si <- sample(1:n, size = m) 

si <- data[rand_obs_si,]
ada_si <- do_ada(si, k, numRep, huge, FALSE) 

k_si <- ada_si$cases
alphas_si <- ada_si$alphas
colnames(alphas_si) <- rownames(si)     

rss_si <- do_alphas_rss(data, si, huge, k_si, rand_obs_si, alphas_si, "ada")
str(rss_si)
                                 



