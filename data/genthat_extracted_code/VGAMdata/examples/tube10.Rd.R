library(VGAMdata)


### Name: tube10
### Title: London Underground (Tube) Passenger Counts for November 2010
### Aliases: tube10
### Keywords: datasets

### ** Examples

## Not run: 
##D data(tube10)
##D waterloo <- tube10[1:(4*24), "Waterloo"]  # Omit the totals and the peaks
##D barplot(unlist(waterloo))
##D barplot(log10(1 + unlist(waterloo)), col = "lightblue",
##D         ylab = "log10(1+.)", las = 1)
## End(Not run)



