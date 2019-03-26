library(shazam)


### Name: minNumSeqMutationsTune
### Title: Parameter tuning for minNumSeqMutations
### Aliases: minNumSeqMutationsTune

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Create model using only silent mutations
sub <- createSubstitutionMatrix(db, model="S", multipleMutation="independent",
                                returnModel="5mer", numMutationsOnly=FALSE,
                                minNumMutations=20)

# Count the number of mutations in sequences containing each 5-mer
mutCount <- createMutabilityMatrix(db, substitutionModel = sub,
                                   model="S", multipleMutation="independent",
                                   numSeqMutationsOnly=TRUE)

# Tune minNumSeqMutations
minNumSeqMutationsTune(mutCount, seq(from=100, to=300, by=50))
## End(No test)                                      



