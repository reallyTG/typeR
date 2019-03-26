library(alakazam)


### Name: makeChangeoClone
### Title: Generate a ChangeoClone object for lineage construction
### Aliases: makeChangeoClone

### ** Examples

# Example Change-O data.frame
db <- data.frame(SEQUENCE_ID=LETTERS[1:4],
                 SEQUENCE_IMGT=c("CCCCTGGG", "CCCCTGGN", "NAACTGGN", "NNNCTGNN"),
                 V_CALL="Homsap IGKV1-39*01 F",
                 J_CALL="Homsap IGKJ5*01 F",
                 JUNCTION_LENGTH=2,
                 GERMLINE_IMGT_D_MASK="CCCCAGGG",
                 CLONE=1,
                 TYPE=c("IgM", "IgG", "IgG", "IgA"),
                 COUNT=1:4,
                 stringsAsFactors=FALSE)

# Without end masking
makeChangeoClone(db, text_fields="TYPE", num_fields="COUNT")

# With end masking
makeChangeoClone(db, max_mask=3, text_fields="TYPE", num_fields="COUNT")




