library(tcR)


### Name: shared.repertoire
### Title: Shared TCR repertoire managing and analysis
### Aliases: shared.repertoire shared.matrix

### ** Examples

## Not run: 
##D # Set "Rank" column in data by "Read.count" column.
##D # This is doing automatically in shared.repertoire() function
##D # if the "Rank" column hasn't been found.
##D immdata <- set.rank(immdata)
##D # Generate shared repertoire using "CDR3.amino.acid.sequence" and
##D # "V.gene" columns and with rank.
##D imm.shared.av <- shared.repertoire(immdata, 'avrc')
## End(Not run)



