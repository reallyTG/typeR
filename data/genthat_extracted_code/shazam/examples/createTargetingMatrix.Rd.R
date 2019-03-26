library(shazam)


### Name: createTargetingMatrix
### Title: Calculates a targeting rate matrix
### Aliases: createTargetingMatrix

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Create 4x1024 models using only silent mutations
sub_model <- createSubstitutionMatrix(db, model="S")
mut_model <- createMutabilityMatrix(db, sub_model, model="S")

# Extend substitution and mutability to including Ns (5x3125 model)
sub_model <- extendSubstitutionMatrix(sub_model)
mut_model <- extendMutabilityMatrix(mut_model)

# Create targeting model from substitution and mutability
tar_model <- createTargetingMatrix(sub_model, mut_model)
## End(No test)




