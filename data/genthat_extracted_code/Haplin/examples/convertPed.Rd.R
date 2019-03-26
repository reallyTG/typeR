library(Haplin)


### Name: convertPed
### Title: Convert large ped files by creating unique IDs, converting
###   allele coding and extracting a selection of SNPs
### Aliases: convertPed

### ** Examples

## Not run: 
##D 
##D # Create unique individual IDs and recode SNP alleles from 1,2,3,4 to A,C,G,T
##D convertPed(ped.infile = "mygwas.ped", map.infile = "mygwas.map",
##D ped.outfile = "mygwas_modified.ped", map.outfile = "mygwas_modified.map",
##D create.unique.id = TRUE, convert = "1234_to_ACGT", ask = TRUE)
##D 
## End(Not run)



