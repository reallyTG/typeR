library(tcR)


### Name: column.summary
### Title: Columns statistics.
### Aliases: column.summary insertion.stats

### ** Examples

## Not run: 
##D # Compute summary statistics of VD insertions
##D # for each V-segment using all V-segments in the given data frame.
##D column.summary(immdata[[1]], 'V.gene', 'Total.insertions')
##D # Compute summary statistics of VD insertions for each V-segment using only V-segments
##D # from the HUMAN_TRBV_MITCR
##D column.summary(immdata[[1]], 'V.gene', 'Total.insertions', HUMAN_TRBV_MITCR)
## End(Not run)



