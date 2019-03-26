library(epiGWAS)


### Name: sample_SNP
### Title: Samples causal SNPs with different effect types
### Aliases: sample_SNP

### ** Examples

clusters <- rep(seq_len(10), each = 3)
names(clusters) <- paste0("SNP_", seq_along(clusters))
MAF <- runif(length(clusters), min = 0.1, max = 0.5)

sample_SNP(nX = 2, nY = 2, nZ12 = 1, clusters, MAF, thresh_MAF = 0.2,
           window_size = 2, overlap_marg = 1, overlap_inter = 0)




