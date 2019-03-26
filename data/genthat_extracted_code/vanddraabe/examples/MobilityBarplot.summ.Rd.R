library(vanddraabe)


### Name: MobilityBarplot.summ
### Title: Mobility Summary Barplots
### Aliases: MobilityBarplot.summ

### ** Examples

  ## Not run: 
##D   MobilityBarplot.summ(data)
##D 
##D   ##----- multiple pages
##D   library(ggforce)
##D   mob.barplots.summary <- MobilityBarplot.summ(data)
##D   num.pages <- ceiling(nrow(data$mobility.counts) / 10)
##D 
##D   pdf(file="multiple_pages.pdf", height=11, width=8.5)
##D   for (page in seq_len(num.pages)) {
##D     print(mob.barplots.summary +
##D           ggforce::facet_wrap_paginate(~PDBid,
##D                                        ncol = 2, nrow = 5, page = page) )
##D   }
##D   dev.off()
##D   
## End(Not run)




