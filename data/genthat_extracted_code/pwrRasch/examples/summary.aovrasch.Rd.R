library(pwrRasch)


### Name: summary.aovrasch
### Title: Object Summary
### Aliases: summary.aovrasch

### ** Examples

## Not run: 
##D 
##D # simulate Rasch model based data
##D # 100 persons, 20 items,
##D dat <- simul.rasch(100, items = seq(-3, 3, length.out = 20))
##D # reshape simulated data into 'long' format with balanced assignment
##D # of examinees into two subgroups.
##D dat.long <- reshape.rasch(dat, group = rep(0:1, each = nrow(dat) / 2))
##D # apply three-way analysis of variance with mixed classification for testing the Rasch model.
##D res <- aov.rasch(dat.long)
##D summary(res)
## End(Not run)



