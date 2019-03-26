library(aVirtualTwins)


### Name: formatRCTDataset
### Title: RCT format for Virtual Twins
### Aliases: formatRCTDataset

### ** Examples

## Not run: 
##D     data.format <- formatRCTDataset(data, "outcome", "treatment", TRUE)
## End(Not run)
data(sepsis)
data.format <- formatRCTDataset(sepsis, "survival", "THERAPY", T)
 

 
  



