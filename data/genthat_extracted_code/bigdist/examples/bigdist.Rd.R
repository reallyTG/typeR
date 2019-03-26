library(bigdist)


### Name: bigdist
### Title: Read or Create a distance matrix on disk
### Aliases: bigdist

### ** Examples

# basics of 'bigdist'
# create a random matrix
set.seed(1)
amat <- matrix(rnorm(1e3), ncol = 10)
td   <- tempdir()

# create a bigdist object with FBM (file-backed matrix) on disk
temp <- bigdist(mat = amat, file = file.path(td, "temp_ex1"))
temp
temp$fbm$backingfile
temp$fbm[1, 2]

# connect to FBM on disk as a bigdist object
temp2 <- bigdist(file = file.path(td, "temp_ex1_100_float"))
temp2
temp2$fbm[1,2]

# check the size of bigdist object
bigdist_size(temp)

# bigdist accessors

# ij
bigdist_extract(temp, 1, 2)
bigdist_extract(temp, 1:2, 3:4)
bigdist_extract(temp, 1:2, 3:4, product = "inner")
dim(bigdist_extract(temp, 1:2,))
dim(bigdist_extract(temp, , 3:4))

# k (lower trianle indexing)
bigdist_extract(temp, k = 3:7)

# bigdist replacers

# ij
bigdist_replace(temp, 1, 2, 10)
bigdist_extract(temp, 1, 2)
bigdist_replace(temp, 1:2, 3:4, 11:12)
bigdist_extract(temp, 1:2, 3:4, product = "inner")

# k (lower trianle indexing)
bigdist_replace(temp, k = 3:7, value = 51:55)
bigdist_extract(temp, k = 3:7)

# subset a bigdist object
temp_subset <- bigdist_subset(temp, index = 21:30, file = file.path(td, "temp_ex2"))
temp_subset
temp_subset$fbm$backingfile

# convert a dist object(in memory) to a bigdist object
temp3 <- as_bigdist(dist(mtcars), file = file.path(td, "temp_ex3"))
temp3



