library(alakazam)


### Name: collapseDuplicates
### Title: Remove duplicate DNA sequences and combine annotations
### Aliases: collapseDuplicates

### ** Examples

# Example Change-O data.frame
db <- data.frame(SEQUENCE_ID=LETTERS[1:4],
                 SEQUENCE_IMGT=c("CCCCTGGG", "CCCCTGGN", "NAACTGGN", "NNNCTGNN"),
                 TYPE=c("IgM", "IgG", "IgG", "IgA"),
                 SAMPLE=c("S1", "S1", "S2", "S2"),
                 COUNT=1:4,
                 stringsAsFactors=FALSE)

# Annotations are not parsed if neither text_fields nor num_fields is specified
# The retained sequence annotations will be random
collapseDuplicates(db, verbose=TRUE)

# Unique text_fields annotations are combined into a single string with ","
# num_fields annotations are summed
# Ambiguous duplicates are discarded
collapseDuplicates(db, text_fields=c("TYPE", "SAMPLE"), num_fields="COUNT", 
                   verbose=TRUE)

# Use alternate delimiter for collapsing textual annotations
collapseDuplicates(db, text_fields=c("TYPE", "SAMPLE"), num_fields="COUNT", 
                   sep="/", verbose=TRUE)

# Add count of duplicates
collapseDuplicates(db, text_fields=c("TYPE", "SAMPLE"), num_fields="COUNT", 
                   add_count=TRUE, verbose=TRUE)

# Masking ragged ends may impact duplicate removal
db$SEQUENCE_IMGT <- maskSeqEnds(db$SEQUENCE_IMGT)
collapseDuplicates(db, text_fields=c("TYPE", "SAMPLE"), num_fields="COUNT", 
                   add_count=TRUE, verbose=TRUE)




