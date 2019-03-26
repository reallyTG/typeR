library(oceanmap)


### Name: name_join
### Title: create "'.gz"-filenames from a list or dataframe
### Aliases: name_join

### ** Examples

## Example: read and plot '.gz'-file
path <- system.file("test_files", package="oceanmap")
gz.files <- Sys.glob(paste0(path,'/*.gz')) # load sample-'.gz'-files
check_gzfiles(folder=path) # return file summary-table

# return summary of availble '.gz'-files
# suffix-column corresponds to option column of the name_join-call
# addition n-column returns the number of available files per filetype
check_gzfiles(gz.files)

## Example: split and rejoin '.gz'-filenames
name_split(gz.files) # return summary-table per file
name_join(name_split(gz.files))



