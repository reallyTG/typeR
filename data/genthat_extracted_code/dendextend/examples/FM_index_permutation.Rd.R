library(dendextend)


### Name: FM_index_permutation
### Title: Calculating Fowlkes-Mallows Index under H0
### Aliases: FM_index_permutation

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- TRUE # sample(1:150, 10 )
##D hc1 <- hclust(dist(iris[ss,-5]), "com")
##D hc2 <- hclust(dist(iris[ss,-5]), "single")
##D # dend1 <- as.dendrogram(hc1)
##D # dend2 <- as.dendrogram(hc2)
##D #    cutree(dend1)   
##D 
##D # small k
##D A1_clusters <- cutree(hc1, k=3) # will give a right tailed distribution
##D # large k
##D A1_clusters <- cutree(hc1, k=50) # will give a discrete distribution
##D # "medium" k
##D A1_clusters <- cutree(hc1, k=25) # gives almost the normal distribution!
##D A2_clusters <- A1_clusters
##D 
##D R <- 10000
##D set.seed(414130)
##D FM_index_H0 <- replicate(R, FM_index_permutation(A1_clusters, A2_clusters)) # can take 10 sec
##D plot(density(FM_index_H0), main = "FM Index distribution under H0\n (10000 permutation)")
##D abline(v = mean(FM_index_H0), col = 1, lty = 2)
##D # The permutation distribution is with a heavy right tail:
##D library(psych)
##D skew(FM_index_H0) # 1.254
##D kurtosi(FM_index_H0) # 2.5427
##D 
##D mean(FM_index_H0); var(FM_index_H0)
##D the_FM_index <- FM_index(A1_clusters, A2_clusters)
##D the_FM_index
##D our_dnorm <- function(x) {
##D    dnorm(x, mean = attr(the_FM_index, "E_FM"), 
##D          sd = sqrt(attr(the_FM_index, "V_FM")))
##D }
##D # our_dnorm(0.35)
##D curve(our_dnorm,
##D       col = 4,
##D       from = -1,to=1,n=R,add = TRUE)
##D abline(v = attr(the_FM_index, "E_FM"), col = 4, lty = 2)
##D 
##D legend("topright", legend = c("asymptotic", "permutation"), fill = c(4,1))
## End(Not run)



