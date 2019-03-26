library(Matrix)


### Name: rep2abI
### Title: Replicate Vectors into 'abIndex' Result
### Aliases: rep2abI
### Keywords: manip

### ** Examples

(ab <- rep2abI(2:7, 4))
stopifnot(identical(as(ab, "numeric"),
	   rep(2:7, 4)))



