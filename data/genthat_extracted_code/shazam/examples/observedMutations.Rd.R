library(shazam)


### Name: observedMutations
### Title: Calculate observed numbers of mutations
### Aliases: observedMutations

### ** Examples

# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgG" & SAMPLE == "+7d")

# Calculate mutation frequency over the entire sequence
db_obs <- observedMutations(db, sequenceColumn="SEQUENCE_IMGT",
                            germlineColumn="GERMLINE_IMGT_D_MASK",
                            frequency=TRUE,
                            nproc=1)

# Count of V-region mutations split by FWR and CDR
# With mutations only considered replacement if charge changes
db_obs <- observedMutations(db, sequenceColumn="SEQUENCE_IMGT",
                            germlineColumn="GERMLINE_IMGT_D_MASK",
                            regionDefinition=IMGT_V,
                            mutationDefinition=CHARGE_MUTATIONS,
                            nproc=1)
                     



