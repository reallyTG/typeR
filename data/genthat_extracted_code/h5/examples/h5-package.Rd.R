library(h5)


### Name: h5-package
### Title: H5 - Interface to the HDF5 API
### Aliases: h5-package

### ** Examples

# 1. Create/Open file 'test.h5' (mode set to 'a'ppend)
file <- h5file("test.h5", 'a')

# 2. Store character vector in group '/test' and dataset 'testvec'
file["test/testvec"] <- LETTERS[1:9]
# Store integer matrix in group '/test/testmat' and dataset 'testmat'
mat <- matrix(1:9, nrow = 3)
rownames(mat) <- LETTERS[1:3]
colnames(mat) <- c("A", "BE", "BUU")
file["test/testmat/testmat"] <- mat
# Store numeric array in group '/test' and dataset 'testarray'
file["test/testarray"] <- array(as.numeric(1:45), dim = c(3, 3, 5))

# 3. Store rownames and column names of matrix as attributes
# Get created data set as object
dset <- file["test/testmat/testmat"]
# Store rownames in attribute 'dimnames_1'
h5attr(dset, "dimnames_1") <- rownames(mat)
# Store columnnames in attribute 'dimnames_2'
h5attr(dset, "dimnames_2") <- colnames(mat)

# 4. Read first 3 elements of testvec
testvec <- file["test/testvec"]
testvec[1:3]
# Read first 2 rows of testmat
testmat <- file["test/testmat/testmat"]
res <- testmat[1:2, ]
# attach rownames and columnnames
rownames(res) <- attr(testmat, "rownames")[1:2]
colnames(res) <- attr(testmat, "colnames")

# 5. Extend testvec 
testvec <- c(testvec, LETTERS[10:26])
# Retrieve entire testvec
testvec[]

# 6. Close open handles
h5close(testvec)
h5close(testmat)
h5close(file)



