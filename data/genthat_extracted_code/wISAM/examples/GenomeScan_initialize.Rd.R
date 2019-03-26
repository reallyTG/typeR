library(wISAM)


### Name: GenomeScan_initialize
### Title: initialize
### Aliases: GenomeScan_initialize

### ** Examples

library(wISAM)

wgs <- GenomeScan$new(y = phenotype,
                      X = covariate_mat,
                      G = locus_list,
                      K = kinship_mat,
                      w = 1/se_mean_per_strain)




