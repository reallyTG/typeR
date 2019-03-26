library(genotypeR)


### Name: read_in_Master_SNPs_data
### Title: Read in GrandMasterSNPs output
### Aliases: read_in_Master_SNPs_data
### Keywords: GrandMasterSNPs read

### ** Examples


##this should be used with the output of the PERL pipeline "GrandMasterSNPs"
marker_file <- system.file("extdata/filtered_markers.txt", package = "genotypeR")

GrandMasterSNPs_markers  <- read_in_Master_SNPs_data(marker_file)




