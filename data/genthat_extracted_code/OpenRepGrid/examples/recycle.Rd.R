library(OpenRepGrid)


### Name: recycle
### Title: recycle vector to given length
### Aliases: recycle
### Keywords: internal

### ** Examples

recycle(c(1,2,3), 7)
recycle(c(1,2,3), letters[1:7])
recycle(c(1,2,3), 7, na.fill=TRUE)
recycle(1, letters[1:3], na.fill=TRUE)
recycle(letters[1:3], 7)
recycle(letters[1:3],  letters[1:7])
recycle(letters[1:40],  letters[1:7])		# vec is cut off



