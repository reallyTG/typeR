library(oceanmap)


### Name: clim_plot
### Title: plots ".gz"-file climatologies
### Aliases: clim_plot

### ** Examples

## Example 1: plot seasonal '.gz'-files, following default plot-procedure
path <- system.file("test_files", package="oceanmap")
gz.file <- Sys.glob(paste0(path,'/*.gz'))[1] # load sample-'.gz'-files
check_gzfiles(folder=path) # return file summary-table
gz.files <- Sys.glob(paste0(path,'/*1s_*.gz')) # load seasonal '.gz'-files
# v(gz.files) # as single plots

## as combined climatology plot, saved in plotfolder
# clim_plot(gz.files,plotname='chla.summary.png') 



