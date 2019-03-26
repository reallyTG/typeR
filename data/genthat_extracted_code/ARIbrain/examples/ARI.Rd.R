library(ARIbrain)


### Name: ARI
### Title: Valid Circular Inference (ARI) for Brain Imaging
### Aliases: ARI

### ** Examples

pvalue_name <- system.file("extdata", "pvalue.nii.gz", package="ARIbrain")
cluster_name <- system.file("extdata", "cluster_th_3.2.nii.gz", package="ARIbrain")
zstat_name <- system.file("extdata", "zstat.nii.gz", package="ARIbrain")
mask_name <- system.file("extdata", "mask.nii.gz", package="ARIbrain")

print(mask_name)
print(pvalue_name)
print(cluster_name)
print(zstat_name)

ARI(Pmap = pvalue_name, clusters= cluster_name, 
    mask=mask_name, Statmap = zstat_name)
    



