library(shazam)


### Name: expectedMutations
### Title: Calculate expected mutation frequencies
### Aliases: expectedMutations

### ** Examples

# Subset example data
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE %in% c("IgA", "IgG") & SAMPLE == "+7d")

# Calculate expected mutations over V region
db_exp <- expectedMutations(db,
                            sequenceColumn="SEQUENCE_IMGT",
                            germlineColumn="GERMLINE_IMGT_D_MASK",
                            regionDefinition=IMGT_V,
                            nproc=1)

# Calculate hydropathy expected mutations over V region
db_exp <- expectedMutations(db,
                           sequenceColumn="SEQUENCE_IMGT",
                           germlineColumn="GERMLINE_IMGT_D_MASK",
                           regionDefinition=IMGT_V,
                           mutationDefinition=HYDROPATHY_MUTATIONS,
                           nproc=1)




