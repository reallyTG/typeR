library(nadiv)


### Name: prunePed
### Title: Prunes a pedigree based on individuals with phenotypes
### Aliases: prunePed prunePed.default prunePed.numPed prunePed.default
###   prunePed.numPed

### ** Examples



# Make a pedigree (with sex) from the warcolak dataset
  warcolak_ped <- warcolak[, 1:4]

# Reduce the number of individuals that have a phenotype for "trait1" in
  #the warcolak dataset
  t1phenotyped <- warcolak
  t1phenotyped[sample(seq.int(nrow(warcolak)), 1500, replace = FALSE), "trait1"] <- NA
  t1phenotyped <- t1phenotyped[which(!is.na(t1phenotyped$trait1)), ]

# The following will give a pedigree with only individuals that have a 
# phenotype for "trait1" OR are an ancestor to a phenotyped individual.
  pruned_warcolak_ped <- prunePed(warcolak_ped, phenotyped = t1phenotyped$ID)

# Now compare the sizes (note, pruned_warcolak_ped retained its column indicating sex.
# We could have kept all of the data associated with individuals who had phenotypic
# information on "trait1" by instead specifying 
#  prunePed(warcolak, phenotyped = t1phenotyped$ID) 
  dim(warcolak_ped)
  dim(pruned_warcolak_ped)





