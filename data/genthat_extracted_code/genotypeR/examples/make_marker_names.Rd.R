library(genotypeR)


### Name: make_marker_names
### Title: Make genotypeR compliant marker names from the output of
###   read_in_Master_SNPs_data function
### Aliases: make_marker_names
### Keywords: GrandMasterSNPs associated compliant genotypeR marker markers
###   names the with

### ** Examples


data(markers)
markers <- make_marker_names(markers)

## Not run: 
##D ##example 
##D GrandMasterSNPs_markers  <- read_in_Master_SNPs_data("GrandMasterSNPs_output")
##D marker_names_GrandMasterSNPs_markers <- make_marker_names(GrandMasterSNPs_markers)
##D If subset of markers needed
##D use the sequenom output to subset the overall marker set from
##D GrandMasterSNPs output
##D seq_test_data <- read_in_sequenom_data("path_to_sequenom_data")
##D col_seq_data <- colnames(seq_test_data)
##D col_markers <- test_data_marker_names$marker_names
##D markerinstudy <- test_data_marker_names[col_markers%in%col_seq_data,]
## End(Not run)




