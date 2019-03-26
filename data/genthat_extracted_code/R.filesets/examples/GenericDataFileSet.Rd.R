library(R.filesets)


### Name: GenericDataFileSet
### Title: The GenericDataFileSet class
### Aliases: GenericDataFileSet
### Keywords: classes

### ** Examples

# Setup a file set
path <- system.file(package="R.filesets")
ds <- GenericDataFileSet$byPath(path)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Data set
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
cat("Path of data set:\n")
print(getPath(ds))

cat("Fullname of data set:\n")
print(getFullName(ds))


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Data files
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
cat("Pathnames:\n")
print(getPathnames(ds))

cat("Filenames:\n")
print(sapply(ds, getFilename))

cat("Extensions:\n")
print(sapply(ds, getExtension))


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Subsetting
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
n <- length(ds)
ds2 <- extract(ds, 1:n)
print(ds2)

ds3 <- extract(ds, n:1)
print(ds3)

stopifnot(identical(rev(getPathnames(ds3)), getPathnames(ds2)))

idxs <- c(1,2,NA,n,NA)
ds4 <- extract(ds, idxs, onMissing="NA")
print(ds4)
print(getFullNames(ds4))
print(getFiles(ds4))

stopifnot(identical(is.na(idxs), unname(is.na(getPathnames(ds4)))))



