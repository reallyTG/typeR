library(tcR)


### Name: find.clonotypes
### Title: Find target clonotypes and get columns' value corresponded to
###   that clonotypes.
### Aliases: find.clonotypes

### ** Examples

## Not run: 
##D # Get ranks of all given sequences in a list of data frames.
##D immdata <- set.rank(immdata)
##D find.clonotypes(.data = immdata, .targets = head(immdata[[1]]$CDR3.amino.acid.sequence),
##D                 .method = 'exact', .col.name = "Rank", .target.col = "CDR3.amino.acid.sequence")
##D # Find close by levenhstein distance clonotypes with similar V-segments and return
##D # their values in columns 'Read.count' and 'Total.insertions'.
##D find.clonotypes(.data = twb, .targets = twb[[1]][, c('CDR3.amino.acid.sequence', 'V.gene')],
##D                 .col.name = c('Read.count', 'Total.insertions'), .method = 'lev',
##D                 .target.col = c('CDR3.amino.acid.sequence', 'V.gene'))
## End(Not run)



