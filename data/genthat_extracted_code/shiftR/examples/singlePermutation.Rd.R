library(shiftR)


### Name: singlePermutation
### Title: Count Feature Overlap Under a Permutation
### Aliases: singlePermutation

### ** Examples

### Number of features
nf = 1e6

### Generate left and right sets
lset = sample(c(0L,1L), size = nf, replace = TRUE)
rset = sample(c(0L,1L), size = nf, replace = TRUE) | lset

# Prepare binary sets:
lbin = shiftrPrepareLeft(lset)
rbin = shiftrPrepareRight(rset)

### count feature overlap
# R calculations
overlapS = sum(lset & rset)
# Binary calculations
overlapF = singlePermutation(lbin, rbin, 0)

message("Feature overlap: ",
        overlapS, " / ", overlapF,
        " (slow/fast count)")
stopifnot( overlapS == overlapF )


### Count overlap with offset
offset = 2017
# R calculations
overlapOS = sum(lset[ c((offset+1):nf, 1:offset)] & rset)
# Binary calculations
overlapOF = singlePermutation(lbin, rbin, offset)

message("Feature overlap at offset: ",
        overlapOS, " / ", overlapOF,
        " (slow/fast count)")
stopifnot( overlapOS == overlapOF )



