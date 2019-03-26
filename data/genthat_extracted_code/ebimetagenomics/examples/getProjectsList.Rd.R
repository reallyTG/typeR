library(ebimetagenomics)


### Name: getProjectsList
### Title: Download the EMG projects list into a data frame
### Aliases: getProjectsList
### Keywords: EMG

### ** Examples
## No test: 
pl = getProjectsList()
str(pl)

# Find big projects
biggies = pl$accession[pl$samples_count >= 100]
ps = getProjectSummary(biggies[3])

# Find some 16S projects
pl$accession[agrep("16S",pl$study_name)]

# Look up primary accession using secondary accession
pl$accession[pl$secondary_accession=="SRP047083"]
## End(No test)


