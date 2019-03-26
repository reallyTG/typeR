library(chinese.misc)


### Name: m3m
### Title: Convert Objects among matrix, dgCMatrix, simple_triplet_matrix,
###   DocumentTermMatrix, TermDocumentMatrix
### Aliases: m3m

### ** Examples

# Make a matrix and convert to a dtm
m <- sample(0: 1, 50, replace = TRUE)
m <- matrix(m, nrow = 5)
colnames(m) <- letters[1: 10]
rownames(m) <- as.character(1: 5)
dtm <- m3m(m, "dtm")
# Convert dtm to dgCMatrix
M <- m3m(dtm, "M")



