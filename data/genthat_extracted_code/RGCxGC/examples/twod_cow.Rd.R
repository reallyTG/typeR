library(RGCxGC)


### Name: twod_cow
### Title: Two-dimensional correlation optimized warping alignment
### Aliases: twod_cow

### ** Examples


library(colorRamps)
GB08_fl <- system.file("extdata", "08GB.cdf", package = "RGCxGC")
GB09_fl <- system.file("extdata", "09GB.cdf", package = "RGCxGC")
GB08 <- read_chrom(GB08_fl, 5L)
GB09 <- read_chrom(GB09_fl, 5L)
## No test: 
GB09_al <- twod_cow(GB09, GB08, c(20, 40), c(2, 8))
## End(No test)




