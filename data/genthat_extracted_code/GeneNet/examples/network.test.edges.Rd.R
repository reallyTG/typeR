library(GeneNet)


### Name: network.test.edges
### Title: Graphical Gaussian Models: Assess Significance of Edges (and
###   Directions)
### Aliases: network.test.edges extract.network
### Keywords: htest

### ** Examples

# load GeneNet library
library("GeneNet")
 
# ecoli data 
data(ecoli)

# estimate partial correlation matrix 
inferred.pcor <- ggm.estimate.pcor(ecoli)

# p-values, q-values and posterior probabilities for each potential edge 
#
test.results <- network.test.edges(inferred.pcor)

# show best 20 edges (strongest correlation)
test.results[1:20,]

# extract network containing edges with prob > 0.9 (i.e. local fdr < 0.1)
net <- extract.network(test.results, cutoff.ggm=0.9)
net

# how many are significant based on FDR cutoff Q=0.05 ?
num.significant.1 <- sum(test.results$qval <= 0.05)
test.results[1:num.significant.1,]

# how many are significant based on "local fdr" cutoff (prob > 0.9) ?
num.significant.2 <- sum(test.results$prob > 0.9)
test.results[test.results$prob > 0.9,]

# parameters of the mixture distribution used to compute p-values etc.
c <- fdrtool(sm2vec(inferred.pcor), statistic="correlation")
c$param




