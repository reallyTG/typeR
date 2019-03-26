library(sequences)


### Name: gccount
### Title: Count bases in sequence
### Aliases: gccount

### ** Examples

s <- "AAAACCCGGT"
cnt <- gccount(s)
cnt
stopifnot(cnt==table(strsplit(s,"")))



