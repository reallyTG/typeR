library(sequences)


### Name: gccount2
### Title: Count bases in sequence (using Rcpp)
### Aliases: gccount2

### ** Examples

s <- "AAAACCCGGT"
cnt <- gccount2(s)
cnt
stopifnot(cnt==table(strsplit(s,"")))



