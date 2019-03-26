library(vanquish)


### Name: rho_est
### Title: Estimate Rho for Alternative Allele Frequency
### Aliases: rho_est

### ** Examples

data("vcf_example")
vcf_list <- list()
vcf_list[[1]] <- vcf_example$VCF
res <- rho_est(vl = vcf_list)
res$het_rho[[1]]$par
res$hom_rho[[1]]$par



