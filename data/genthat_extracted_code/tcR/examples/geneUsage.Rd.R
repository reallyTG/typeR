library(tcR)


### Name: geneUsage
### Title: Gene usage.
### Aliases: geneUsage

### ** Examples

## Not run: 
##D # Load your data
##D data(twb)
##D # compute V-segments frequencies of human TCR beta.
##D seg <- geneUsage(twb, HUMAN_TRBV, .norm = T)
##D # plot V-segments frequencies as a heatmap
##D vis.heatmap(seg, .labs = c("Sample", "V gene"))
##D # plot V-segments frequencies directly from clonesets
##D vis.gene.usage(twb, HUMAN_TRBV)
##D # plot V-segments frequencies from the gene frequencies
##D vis.gene.usage(seg, NA)
##D # Compute V-J joint usage.
##D geneUsage(twb, list(HUMAN_TRBV, HUMAN_TRBJ))
##D # for future:
##D # geneUsage(twb, "human", "trbv")
## End(Not run)



