library(paleotree)


### Name: graptPBDB
### Title: Example Occurrence and Taxonomic Datasets of the Graptolithina
###   from the Paleobiology Database
### Aliases: graptPBDB graptOccPBDB graptTaxaPBDB
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D #original code used to obtain this dataset on March 21st, 2015
##D 		# using version 1.2 of the Paleobiology Database API
##D 
##D # (sorry, URLs removed as they lead to the PBDB test server...)
##D 
##D save(graptOccPBDB,graptTaxaPBDB,file = "graptPBDB.rdata")
##D 
## End(Not run)

# load archived example data
data(graptPBDB)

# let's visualize who entered the majority of the occurrence data
pie(sort(table(graptOccPBDB$enterer)))
# and now who authorized it
pie(sort(table(graptOccPBDB$authorizer)))
# I apologize for using pie charts.

# Let's look at age resolution of these occurrences
hist(graptOccPBDB$early_age-graptOccPBDB$late_age,
	main = "Age Resolution of Occurrences", xlab = "Ma")

#distribution of taxa among taxonomic ranks
table(graptTaxaPBDB$taxon_rank)
barplot(table(graptTaxaPBDB$taxon_rank))




