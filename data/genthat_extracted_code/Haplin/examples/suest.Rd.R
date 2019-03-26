library(Haplin)


### Name: suest
### Title: Compute a joint p-value for a list of haplin fits (usually from
###   a sliding window approach), correcting for multiple testing.
### Aliases: suest

### ** Examples


## Not run: 
##D # (Almost) all standard haplin runs can be done with haplinSlide. 
##D # Below is an illustration. See the haplin help page for more 
##D # examples.
##D # 
##D # Analyzing the effect of fetal genes, including triads with missing data,
##D # using a multiplicative response model. When winlength = 1, separate
##D # markers are used. To make longer windows, winlength can be increased
##D # correspondingly:
##D result.1 <- haplinSlide("C:/work/data.dat", use.missing = T, response = "mult",
##D reference = "ref.cat", winlength = 1, table.output = F)
##D # Provide summary of separate results:
##D lapply(result.1, summary)
##D # Plot results:
##D par(ask = T)
##D lapply(result.1, plot)
##D # Compute an overall p-value for the scan, corrected for multiple testing
##D # and dependencies between windows:
##D suest(result.1)
##D 
## End(Not run)




