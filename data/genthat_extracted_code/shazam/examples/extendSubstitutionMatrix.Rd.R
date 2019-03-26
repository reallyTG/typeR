library(shazam)


### Name: extendSubstitutionMatrix
### Title: Extends a substitution model to include Ns.
### Aliases: extendSubstitutionMatrix

### ** Examples

# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Create model using only silent mutations
sub_model <- createSubstitutionMatrix(db, model="S")
ext_model <- extendSubstitutionMatrix(sub_model)




