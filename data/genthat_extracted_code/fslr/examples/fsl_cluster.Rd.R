library(fslr)


### Name: fsl_cluster
### Title: Form clusters, report information about clusters and/or perform
###   cluster-based inference.  Wrapper for 'cluster'
### Aliases: fsl_cluster fslcluster read_cluster_table

### ** Examples

if (have_fsl()) { 
file = mni_fname(brain = TRUE, mask = FALSE)
threshold = 6000
clus = fsl_cluster(file, threshold)
}



