library(CJAMP)


### Name: compute_MAF
### Title: Compute minor allele frequency of genetic variants.
### Aliases: compute_MAF

### ** Examples

# Example of a single variant
genodata <- stats::rbinom(2000, 2, 0.3)
compute_MAF(genodata)

# Example of a set of variants
genodata <- generate_genodata()
compute_MAF(genodata)




