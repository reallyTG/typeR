library(QCGWAS)


### Name: create_hapmap_reference
### Title: Create an allele-reference file from HapMap data
### Aliases: create_hapmap_reference

### ** Examples

  # This command will download the CEU HapMap dataset and use
  # it to generate an allele-reference. Create a folder
  # "new_hapmap" to store the data and make sure there is
  # sufficient disk space and a reasonably fast internet
  # connection.

  #new_hapmap <- create_hapmap_reference(dir = "C:/new_hapmap",
  # download_hapmap = TRUE, download_subset = "CEU",
  # filename = "new_hapmap", save_txt = TRUE,
  # return_reference = TRUE)



