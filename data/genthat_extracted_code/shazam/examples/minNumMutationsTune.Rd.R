library(shazam)


### Name: minNumMutationsTune
### Title: Parameter tuning for minNumMutations
### Aliases: minNumMutationsTune

### ** Examples

# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Count the number of mutations per 5-mer
subCount <- createSubstitutionMatrix(db, model="S", multipleMutation="independent",
                                     returnModel="5mer", numMutationsOnly=TRUE)

# Tune minNumMutations
minNumMutationsTune(subCount, seq(from=10, to=100, by=10))
                                      



