library(RBMRB)


### Name: fetch_entry_chemical_shifts
### Title: Imports chemical shift table for a given entry or list of
###   entries from BMRB data base
### Aliases: fetch_entry_chemical_shifts

### ** Examples

df<-fetch_entry_chemical_shifts(15060)
# Downloads NMR chemical shifts of a single entry from BMRB
df<-fetch_entry_chemical_shifts(c(17074,17076,17077))
# Downloads NMR chemical shifts of multiple entries from BMRB
df<-fetch_entry_chemical_shifts(c('bmse000034','bmse000035','bmse000036'))
# Downloads data from BMRB metabolomics database



