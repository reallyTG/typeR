library(micompr)


### Name: summary.grpoutputs
### Title: Summary method for grouped outputs
### Aliases: summary.grpoutputs

### ** Examples

# Determine paths for data folders, each containing outputs for 10 runs of
# the PPHPC model
dir_nl_ok <- system.file("extdata", "nl_ok", package = "micompr")
dir_jex_noshuff <-
 system.file("extdata", "j_ex_noshuff", package = "micompr")
files <- glob2rx("stats400v1*.tsv")

# Create a grpoutputs object
go <-
 grpoutputs(c("o1", "o2"), c(dir_nl_ok, dir_jex_noshuff), c(files, files))




