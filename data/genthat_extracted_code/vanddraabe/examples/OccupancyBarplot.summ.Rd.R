library(vanddraabe)


### Name: OccupancyBarplot.summ
### Title: Occupancy Summary Barplots
### Aliases: OccupancyBarplot.summ

### ** Examples

  ## Not run: 
##D   OccupancyBarplot.summ(data)
##D 
##D   ##----- multiple pages
##D   library(ggforce)
##D   occ.barplots.summary <- OccupancyBarplot.summ(data)
##D   num.pages <- ceiling(nrow(data$occupancy.counts) / 10)
##D 
##D   pdf(file="multiple_pages.pdf", height=11, width=8.5)
##D   for (page in seq_len(num.pages)) {
##D     print(occ.barplots.summary +
##D           ggforce::facet_wrap_paginate(~PDBid,
##D                                        ncol = 2, nrow = 5, page = page) )
##D   }
##D   dev.off()
##D   
## End(Not run)




