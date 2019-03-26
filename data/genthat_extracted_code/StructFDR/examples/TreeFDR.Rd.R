library(StructFDR)


### Name: TreeFDR
### Title: False Discovery Rate (FDR) Control Integrating Prior Tree
###   Structure for Microbiome Data
### Aliases: TreeFDR
### Keywords: Multiple testing False discovery rate Genetics Metagenomics
###   Genomics

### ** Examples

require(ape) 
require(nlme)
require(cluster)
require(StructFDR)

# Generate a caelescence tree and partition into 10 clusters
set.seed(1234)
n <- 20
p <- 200
tree <- rcoal(p)
D <- cophenetic(tree)
clustering <- pam(D, k=10)$clustering

# Simulate case-control data, assuming cluster 2 is differential  
X.control <- matrix(rnorm(n*p), p, n)
X.case <- matrix(rnorm(n*p), p, n)
eff.size <- rnorm(sum(clustering == 2), 0.5, 0.2)     
X.case[clustering == 2, ] <- X.case[clustering == 2, ] + eff.size
X <- cbind(X.control, X.case)
Y <- gl(2, n) 

# Define testing and permutation function
test.func <- function (X, Y) {
	obj <- apply(X, 1, function(x) {
				ttest.obj <- t.test(x ~ Y)
				c(ttest.obj$p.value, sign(ttest.obj$statistic))
			})
    return(list(p.value=obj[1, ], e.sign=obj[2, ]))
}

perm.func <- function (X, Y) {
	return(list(X=X, Y=sample(Y)))
}

# Call TreeFDR
tree.fdr.obj <- TreeFDR(X, Y, tree, test.func, perm.func)

# Compare TreeFDR and BH
tree.fdr.obj$p.adj
tree.fdr.obj$p.adj[clustering == 2]
BH.p.adj <- p.adjust(tree.fdr.obj$p.unadj, 'fdr')
BH.p.adj[clustering == 2]

# Adjusted statistics vs clustering
par(mfrow=c(1, 2))
plot(clustering, tree.fdr.obj$z.unadj)
plot(clustering, tree.fdr.obj$z.adj)



