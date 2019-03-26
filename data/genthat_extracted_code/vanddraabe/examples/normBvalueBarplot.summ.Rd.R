library(vanddraabe)


### Name: normBvalueBarplot.summ
### Title: Normalized B-value Summary Barplots
### Aliases: normBvalueBarplot.summ

### ** Examples

  ## Not run: 
##D   normBvalueBarplot.summ(data)
##D 
##D   ##----- multiple pages
##D   library(ggforce)
##D   nBvalue.barplots.summary <- normBvalueBarplot.summ(data)
##D   num.pages <- ceiling(nrow(data$normBvalue.counts) / 10)
##D 
##D   pdf(file="multiple_pages.pdf", height=11, width=8.5)
##D   for (page in seq_len(num.pages)) {
##D     print(nBvalue.barplots.summary +
##D           ggforce::facet_wrap_paginate(~PDBid,
##D                                        ncol = 2, nrow = 5, page = page) )
##D   }
##D   dev.off()
##D   
## End(Not run)




