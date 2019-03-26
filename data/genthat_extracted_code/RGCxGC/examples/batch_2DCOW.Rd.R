library(RGCxGC)


### Name: batch_2DCOW
### Title: Two Dimensional COW in batch.
### Aliases: batch_2DCOW

### ** Examples


GB08_fl <- system.file("extdata", "08GB.cdf", package = "RGCxGC")
GB09_fl <- system.file("extdata", "09GB.cdf", package = "RGCxGC")
chrom_nm <- c(GB08_fl, GB09_fl)
## No test: 
batch_alignment <- batch_2DCOW(chrom_nm, 5L, c(10, 40), c(1, 10))
## End(No test)




