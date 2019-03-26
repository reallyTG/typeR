library(shazam)


### Name: createTargetingModel
### Title: Creates a TargetingModel
### Aliases: createTargetingModel

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Create model using only silent mutations and ignore multiple mutations
model <- createTargetingModel(db, model="S", multipleMutation="ignore")
## End(No test)




