library(micompr)


### Name: plot.grpoutputs
### Title: Plot grouped outputs
### Aliases: plot.grpoutputs

### ** Examples

# Determine paths for the data folder containing outputs of different
# lengths
dir_na <- system.file("extdata", "testdata", "NA", package = "micompr")

# Sets of files A and B have 3 files each
filesA <- glob2rx("stats400v1*n20A.tsv")
filesB <- glob2rx("stats400v1*n20B.tsv")

# Instantiate grpoutputs object
go <-
 grpoutputs(7, dir_na, c(filesA, filesB), lvls = c("A", "B"), concat = TRUE)

# Plot grpoutputs object
plot(go)




