library(RGCxGC)


### Name: plot
### Title: Method plot
### Aliases: plot plot,GCxGC-method

### ** Examples


library(colorRamps)
chrom_name <-  system.file("extdata", "08GB.cdf", package = "RGCxGC")
chrom_2D <- read_chrom(chrom_name, 5L)
plot(chrom_2D, nlevels = 150, color.palette = matlab.like)




