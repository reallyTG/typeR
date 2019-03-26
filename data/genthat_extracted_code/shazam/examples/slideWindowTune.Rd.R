library(shazam)


### Name: slideWindowTune
### Title: Parameter tuning for sliding window approach
### Aliases: slideWindowTune

### ** Examples

# Load and subset example data
data(ExampleDb, package="alakazam")
db <- ExampleDb[1:5, ]

# Try out thresholds of 2-4 mutations in window sizes of 7-9 nucleotides. 
# In this case, all combinations are legal.
slideWindowTune(db, mutThreshRange=2:4, windowSizeRange=7:9)

# Illegal combinations are skipped, returning NAs.
slideWindowTune(db, mutThreshRange=2:4, windowSizeRange=2:4, 
                verbose=FALSE)
                                                            
# Run calcObservedMutations separately
exDbMutList <- sapply(1:5, function(i) {
    calcObservedMutations(inputSeq=db[i, "SEQUENCE_IMGT"],
                          germlineSeq=db[i, "GERMLINE_IMGT_D_MASK"],
                          returnRaw=TRUE)$pos })
slideWindowTune(db, dbMutList=exDbMutList, 
                mutThreshRange=2:4, windowSizeRange=2:4)
                                                           



