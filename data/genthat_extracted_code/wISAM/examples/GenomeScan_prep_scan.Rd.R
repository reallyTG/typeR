library(wISAM)


### Name: GenomeScan_prep_scan
### Title: prep_scan
### Aliases: GenomeScan_prep_scan

### ** Examples

library(wISAM)

wgs <- GenomeScan$new(y = phenotype,
                      X = covariate_mat,
                      G = locus_list,
                      K = kinship_mat,
                      w = 1/se_mean_per_strain)

result <- wgs$prep_scan()




