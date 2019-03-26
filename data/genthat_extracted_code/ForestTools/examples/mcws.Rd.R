library(ForestTools)


### Name: mcws
### Title: Marker-Controlled Watershed Segmentation
### Aliases: mcws

### ** Examples

# Use variable window filter to detect treetops in demo canopy height model
ttops <- vwf(CHMdemo, winFun = function(x){x * 0.06 + 0.5}, minHeight = 2)

# Set minimum tree crown height (should be LOWER than minimum treetop height)
minCrwnHgt <- 1

# Use 'mcws' to outline tree crowns
segs <- mcws(ttops, CHMdemo, minCrwnHgt)




