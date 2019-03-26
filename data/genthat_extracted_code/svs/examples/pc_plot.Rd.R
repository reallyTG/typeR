library(svs)


### Name: pc_plot
### Title: Plotting Parallel Coordinates
### Aliases: pc_plot

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.SndT_Fra <- fast_sca(SndT_Fra)
pc_plot(sca.SndT_Fra$pos1, las = "vertical")



