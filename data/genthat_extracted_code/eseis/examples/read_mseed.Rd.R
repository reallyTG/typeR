library(eseis)


### Name: read_mseed
### Title: Read mseed files.
### Aliases: read_mseed

### ** Examples


## Not run: 
##D ## read mseed file with default options
##D x <- read_mseed(file = "input.miniseed")
##D 
##D ## read mseed file, only signal trace, not as eseis object
##D x <- read_mseed(file = "input.miniseed", 
##D                 time = FALSE, 
##D                 meta = FALSE, 
##D                 header = FALSE, 
##D                 eseis = FALSE)
##D                 
##D ## read more than one mseed files and append traces
##D x <- read_mseed(file = c("input_1.miniseed", "input_2.miniseed"))
## End(Not run)




