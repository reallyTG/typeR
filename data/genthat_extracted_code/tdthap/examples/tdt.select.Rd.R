library(tdthap)


### Name: tdt.select
### Title: Select informative transmissions of sub-haplotypes for the TDT
###   test
### Aliases: tdt.select
### Keywords: htest

### ** Examples

## Not run: 
##D # Select the sub-haplotype made up from the first two markers and print 
##D # tables of frequencies of transmitted and untransmitted haplotypes
##D 
##D 
##D 	hap.use <- tdt.select(haps, markers=1:2)
##D 	table(hap.use$trans)
##D 	table(hap.use$untrans)
## End(Not run)


