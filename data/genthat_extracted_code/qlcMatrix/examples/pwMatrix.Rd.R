library(qlcMatrix)


### Name: pwMatrix
### Title: Construct 'part-whole' (pw) Matrices from tokenized strings
### Aliases: pwMatrix

### ** Examples

# By itself, this functions does nothing really interesting
example <- c("this","is","an","example")
pw <- pwMatrix(example)
pw

# However, making a type-token Matrix (with ttMatrix) of the rownames
# and then taking a matrix product, results in frequencies of each element in the strings
tt <- ttMatrix(pw$rownames)
distr <- (tt$M*1) %*% (pw$M*1)
rownames(distr) <- tt$rownames
colnames(distr) <- example
distr

# Use banded sparse matrix with superdiagonal ('shift matrix') to get co-occurrence counts
# of adjacent characters. Rows list first character, columns adjacent character. 
# Non-zero entries list number of co-occurrences
S <- bandSparse( n = ncol(tt$M), k = 1) * 1
TT <- tt$M * 1
( C <- TT %*% S %*% t(TT) )

# show the non-zero entries as triplets:
s <- summary(C)
first <- tt$rownames[s[,1]]
second <- tt$rownames[s[,2]]
freq <- s[,3]
data.frame(first,second,freq)	



