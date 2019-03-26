library(oceanmap)


### Name: check_gzfiles
### Title: Returns summary on ".gz"-file types
### Aliases: check_gzfiles

### ** Examples

## Example 1: plot '.gz'-files, following default plot-procedure
path <- system.file("test_files", package="oceanmap")
check_gzfiles(folder=path) # return file summary-table per filetype

## check for missing dates
check_ts('medw4*',folder=path)
check_ts('medw4*',folder=path,output=TRUE)



