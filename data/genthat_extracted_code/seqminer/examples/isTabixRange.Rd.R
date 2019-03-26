library(seqminer)


### Name: isTabixRange
### Title: Check if the inputs are valid tabix range such as chr1:2-300
### Aliases: isTabixRange

### ** Examples

valid <- isTabixRange(c("chr1:1-200", "X:1", "1:100-100", "chr1", "1:1-20,1:30-40"))
stopifnot(all(valid))
invalid <- isTabixRange(c(":1", "chr1::", ":-"))
stopifnot(all(!invalid))



