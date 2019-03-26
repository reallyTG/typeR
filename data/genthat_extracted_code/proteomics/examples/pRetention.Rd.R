library(proteomics)


### Name: pRetention
### Title: Plot Retention Time Statistics
### Aliases: pRetention

### ** Examples

## Not run: 
##D iglobal <- addIonSatistics(pglobal)
##D rglobal <- addRetentionTimeStatistics(iglobal, .parallel=TRUE)
##D rglob$outlier <- with(rglob, abs(retention.atApex - retention) > 4)
##D p <- pRetention(rglobal)
##D 
##D p + geom_point(aes(retention.atApex, retention))
##D p + geom_point(aes(retention.atApex, retention-retention.atApex))
##D p + geom_point(aes(ppm, retention-retention.atApex))
##D p + geom_density(aes(x=ppm), alpha=.242)
## End(Not run)



