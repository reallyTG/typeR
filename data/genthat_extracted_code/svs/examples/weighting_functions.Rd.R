library(svs)


### Name: weighting_functions
### Title: Weighting Functions
### Aliases: gw_bin gw_ent gw_gfidf gw_idf gw_idf_alt gw_nor gw_raw lw_bin
###   lw_log lw_raw lw_tf weighting_functions

### ** Examples

SndT_Fra <- read.table(system.file("extdata", "SndT_Fra.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
tab.SndT_Fra <- table(SndT_Fra)
lw_log(tab.SndT_Fra)
gw_idf(tab.SndT_Fra)



