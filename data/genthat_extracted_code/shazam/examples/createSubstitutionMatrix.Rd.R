library(shazam)


### Name: createSubstitutionMatrix
### Title: Builds a substitution model
### Aliases: createSubstitutionMatrix

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Count the number of mutations per 5-mer
subCount <- createSubstitutionMatrix(db, model="S", multipleMutation="independent",
                                     returnModel="5mer", numMutationsOnly=TRUE)

# Create model using only silent mutations
sub <- createSubstitutionMatrix(db, model="S", multipleMutation="independent",
                                returnModel="5mer", numMutationsOnly=FALSE,
                                minNumMutations=20)
## End(No test)




