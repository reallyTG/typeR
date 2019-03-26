library(shazam)


### Name: calcObservedMutations
### Title: Count the number of observed mutations in a sequence.
### Aliases: calcObservedMutations

### ** Examples

# Use an entry in the example data for input and germline sequence
data(ExampleDb, package="alakazam")
in_seq <- ExampleDb[["SEQUENCE_IMGT"]][100]
germ_seq <-  ExampleDb[["GERMLINE_IMGT_D_MASK"]][100]

# Identify all mutations in the sequence
ex1_raw <- calcObservedMutations(in_seq, germ_seq, returnRaw=TRUE)
# Count all mutations in the sequence
ex1_count <- calcObservedMutations(in_seq, germ_seq, returnRaw=FALSE)
ex1_freq <- calcObservedMutations(in_seq, germ_seq, returnRaw=FALSE, frequency=TRUE)
# Compare this with ex1_count
table(ex1_raw$pos$region, ex1_raw$pos$R)[, "1"]
table(ex1_raw$pos$region, ex1_raw$pos$S)[, "1"]
# Compare this with ex1_freq
table(ex1_raw$pos$region, ex1_raw$pos$R)[, "1"]/ex1_raw$nonN
table(ex1_raw$pos$region, ex1_raw$pos$S)[, "1"]/ex1_raw$nonN

# Identify only mutations the V segment minus CDR3
ex2_raw <- calcObservedMutations(in_seq, germ_seq, 
                                regionDefinition=IMGT_V, returnRaw=TRUE)
# Count only mutations the V segment minus CDR3
ex2_count <- calcObservedMutations(in_seq, germ_seq, 
                                  regionDefinition=IMGT_V, returnRaw=FALSE)
ex2_freq <- calcObservedMutations(in_seq, germ_seq, 
                                 regionDefinition=IMGT_V, returnRaw=FALSE,
                                 frequency=TRUE)
# Compare this with ex2_count
table(ex2_raw$pos$region, ex2_raw$pos$R)[, "1"]
table(ex2_raw$pos$region, ex2_raw$pos$S)[, "1"]                              
# Compare this with ex2_freq
table(ex2_raw$pos$region, ex2_raw$pos$R)[, "1"]/ex2_raw$nonN     
table(ex2_raw$pos$region, ex2_raw$pos$S)[, "1"]/ex2_raw$nonN                                       

# Identify mutations by change in hydropathy class
ex3_raw <- calcObservedMutations(in_seq, germ_seq, regionDefinition=IMGT_V,
                                mutationDefinition=HYDROPATHY_MUTATIONS, 
                                returnRaw=TRUE)
# Count mutations by change in hydropathy class
ex3_count <- calcObservedMutations(in_seq, germ_seq, regionDefinition=IMGT_V,
                                  mutationDefinition=HYDROPATHY_MUTATIONS, 
                                  returnRaw=FALSE)
ex3_freq <- calcObservedMutations(in_seq, germ_seq, regionDefinition=IMGT_V,
                                 mutationDefinition=HYDROPATHY_MUTATIONS, 
                                 returnRaw=FALSE, frequency=TRUE)
# Compre this with ex3_count
table(ex3_raw$pos$region, ex3_raw$pos$R)[, "1"]
table(ex3_raw$pos$region, ex3_raw$pos$S)[, "1"]
# Compare this with ex3_freq
table(ex3_raw$pos$region, ex3_raw$pos$R)[, "1"]/ex3_raw$nonN                                        
table(ex3_raw$pos$region, ex3_raw$pos$S)[, "1"]/ex3_raw$nonN                                        
                                



