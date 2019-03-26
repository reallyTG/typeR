library(shazam)


### Name: calcExpectedMutations
### Title: Calculate expected mutation frequencies of a sequence
### Aliases: calcExpectedMutations

### ** Examples

# Load example data
data(ExampleDb, package="alakazam")

# Use first entry in the exampled data for input and germline sequence
in_seq <- ExampleDb[["SEQUENCE_IMGT"]][1]
germ_seq <-  ExampleDb[["GERMLINE_IMGT_D_MASK"]][1]

# Identify all mutations in the sequence
calcExpectedMutations(in_seq, germ_seq)

# Identify only mutations the V segment minus CDR3
calcExpectedMutations(in_seq, germ_seq, regionDefinition=IMGT_V)

# Define mutations based on hydropathy
calcExpectedMutations(in_seq, germ_seq, regionDefinition=IMGT_V,
                      mutationDefinition=HYDROPATHY_MUTATIONS)




