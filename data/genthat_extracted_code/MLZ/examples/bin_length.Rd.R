library(MLZ)


### Name: bin_length
### Title: Bin length data
### Aliases: bin_length

### ** Examples

## Not run: 
##D data(SilkSnapper)
##D Silk.matrix <- bin_length(SilkSnapper, breaks = seq(80, 830, 10))
##D Silk.matrix <- bin_length(SilkSnapper)
##D new.dataset <- new("MLZ_data", Year = Silk.matrix$Year, Len_bins = Silk.matrix$Len_bins,
##D Len_matrix = Silk.matrix$Len_matrix)
## End(Not run) 



