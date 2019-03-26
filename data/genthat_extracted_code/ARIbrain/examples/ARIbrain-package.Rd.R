library(ARIbrain)


### Name: ARIbrain-package
### Title: All-Resolutions Inference
### Aliases: ARIbrain-package

### ** Examples

pvalue_name <- system.file("extdata", "pvalue.nii.gz", package="ARIbrain")
cluster_name <- system.file("extdata", "cluster_th_3.2.nii.gz", package="ARIbrain")
zstat_name <- system.file("extdata", "zstat.nii.gz", package="ARIbrain")
mask_name <- system.file("extdata", "mask.nii.gz", package="ARIbrain")

ARI(Pmap = pvalue_name, clusters= cluster_name, 
    mask=mask_name, Statmap = zstat_name)




