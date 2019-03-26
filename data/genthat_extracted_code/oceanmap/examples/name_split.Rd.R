library(oceanmap)


### Name: name_split
### Title: Returns a summary data frame of ".gz" encoded oceanography files
###   by splitting their name
### Aliases: name_split get.gz.info

### ** Examples

## Example: read and plot '.gz'-file
path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files
check_gzfiles(folder=path) # return file summary-table

# return summary of availble '.gz'-files
# suffix-column corresponds to option column of the name_split-call
# addition n-column returns the number of available files per filetype
check_gzfiles(gz.files)

## Example: split and rejoin '.gz'-filenames
gz.files
name_split(gz.files) # return summary-table per file
name_split() # return summary-table of all gz-file in current folder
name_join(name_split(gz.files))



