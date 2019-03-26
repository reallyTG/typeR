library(BoardGames)


### Name: detect_seq
### Title: Detects if a certain sequence is present in a matrix.
### Aliases: detect_seq
### Keywords: detect matrix search sequence vector

### ** Examples

M = matrix(sample(c(1,2),25,replace=TRUE),5,5)
detect_seq(data = M, sequence = "2", reps = 5)
#or equivalently
detect_seq(data = M, sequence = "22222", reps = 1)



