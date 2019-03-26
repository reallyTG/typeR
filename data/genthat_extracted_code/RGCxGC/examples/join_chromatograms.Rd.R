library(RGCxGC)


### Name: join_chromatograms
### Title: Join two-dimensional chromatograms into a single R object
### Aliases: join_chromatograms

### ** Examples


GB08_fl <- system.file("extdata", "08GB.cdf", package = "RGCxGC")
GB09_fl <- system.file("extdata", "09GB.cdf", package = "RGCxGC")
GB08 <- read_chrom(GB08_fl, 5L)
GB09 <- read_chrom(GB09_fl, 5L)
join_gc <- join_chromatograms(GB08, GB09)



