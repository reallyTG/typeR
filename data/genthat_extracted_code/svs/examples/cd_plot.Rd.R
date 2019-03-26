library(svs)


### Name: cd_plot
### Title: Plotting a Cumulative Distribution
### Aliases: cd_plot

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
dis.SndT_Fra <- dist_wrt(sca.SndT_Fra$pos1)
cd_plot(dis.SndT_Fra)



