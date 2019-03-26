library(bigmemory)


### Name: write.big.matrix
### Title: File interface for a "big.matrix"
### Aliases: write.big.matrix write.big.matrix,big.matrix,character-method
###   read.big.matrix read.big.matrix,character-method
### Keywords: methods

### ** Examples

# Without specifying the type, this big.matrix x will hold integers.

x <- as.big.matrix(matrix(1:10, 5, 2))
x[2,2] <- NA
x[,]
temp_dir = tempdir()
if (!dir.exists(temp_dir)) dir.create(temp_dir)
write.big.matrix(x, file.path(temp_dir, "foo.txt"))

# Just for fun, I'll read it back in as character (1-byte integers):
y <- read.big.matrix(file.path(temp_dir, "foo.txt"), type="char")
y[,]

# Other examples:
w <- as.big.matrix(matrix(1:10, 5, 2), type='double')
w[1,2] <- NA
w[2,2] <- -Inf
w[3,2] <- Inf
w[4,2] <- NaN
w[,]
write.big.matrix(w, file.path(temp_dir, "bar.txt"))
w <- read.big.matrix(file.path(temp_dir, "bar.txt"), type="double")
w[,]
w <- read.big.matrix(file.path(temp_dir, "bar.txt"), type="short")
w[,]

# Another example using row names (which we don't like).
x <- as.big.matrix(as.matrix(iris), type='double')
rownames(x) <- as.character(1:nrow(x))
head(x)
write.big.matrix(x, file.path(temp_dir, 'IrisData.txt'), col.names=TRUE, 
                 row.names=TRUE)
y <- read.big.matrix(file.path(temp_dir, "IrisData.txt"), header=TRUE, 
                     has.row.names=TRUE)
head(y)

# The following would fail with a dimension mismatch:
if (FALSE) y <- read.big.matrix(file.path(temp_dir, "IrisData.txt"), 
                                header=TRUE)



