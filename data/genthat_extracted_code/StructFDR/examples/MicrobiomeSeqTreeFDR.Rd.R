library(StructFDR)


### Name: MicrobiomeSeqTreeFDR
### Title: False Discovery Rate (FDR) Control Integrating Prior Tree
###   Structure for Microbiome Data Based on F-test and Residual
###   Permutation.
### Aliases: MicrobiomeSeqTreeFDR
### Keywords: Multiple testing False discovery rate Genetics Metagenomics
###   Genomics

### ** Examples

require(StructFDR)

# Generate data
data(throat.parameter)
data.obj <- SimulateData(nCases = 50, nControls = 50, nOTU = 400, nCluster = 20, 
		depth = 10000, p.est = throat.parameter$p.est, theta = throat.parameter$theta,
        scene = 'S2', signal.strength = 4)
meta.dat <- data.frame(group = factor(data.obj$y), sex = sample(gl(2, 50)))
beta.true <- data.obj$beta.true

# Call TreeFDR
tree.fdr.obj <- MicrobiomeSeqTreeFDR(data.obj$X, data.obj$tree, meta.dat, 'group', 'sex', B = 20)
tree.p.adj <- tree.fdr.obj$p.adj

# Empirical power and FDR
(tree.emp.pwr <- sum(tree.p.adj <= 0.05 & beta.true != 0) / sum(beta.true != 0)) 
(tree.emp.fdr <- sum(tree.p.adj <= 0.05 & beta.true == 0) / sum(tree.p.adj <= 0.05)) 




