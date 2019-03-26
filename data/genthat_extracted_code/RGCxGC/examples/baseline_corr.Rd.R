library(RGCxGC)


### Name: baseline_corr
### Title: Bidimensional baseline correction
### Aliases: baseline_corr

### ** Examples

library(colorRamps)
chrom_name <- system.file("extdata", "08GB.cdf", package = "RGCxGC")
chrom_2D <- read_chrom(chrom_name, 5L)
chrom_bsline <- baseline_corr(chrom_2D)
plot(chrom_bsline, nlevels = 150,
           color.palette = matlab.like)




