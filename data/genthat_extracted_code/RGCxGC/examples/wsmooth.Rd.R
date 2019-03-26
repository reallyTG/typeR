library(RGCxGC)


### Name: wsmooth
### Title: Bidimensional smoothing
### Aliases: wsmooth

### ** Examples


chrom_name <- system.file("extdata", "08GB.cdf", package = "RGCxGC")
chrom_2D <- read_chrom(chrom_name, 5L)
chrom_smooth <- wsmooth(chrom_2D, penalty = 1, lambda = 1e1)
plot(chrom_smooth, nlevels = 150,
           color.palette = colorRamps::matlab.like,
           main = expression(paste(lambda, "= 10, penalty = 1")) )




