library(shazam)


### Name: calculateMutability
### Title: Calculate total mutability
### Aliases: calculateMutability

### ** Examples

## No test: 
# Subset example data to one isotype and sample as a demo
data(ExampleDb, package="alakazam")
db <- subset(ExampleDb, ISOTYPE == "IgA" & SAMPLE == "-1h")

# Calculate mutability of germline sequences using HH_S5F model
mutability <- calculateMutability(sequences=db$GERMLINE_IMGT_D_MASK, model=HH_S5F)
## End(No test)




