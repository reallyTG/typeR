library(R.filesets)


### Name: TabularTextFileSet
### Title: The TabularTextFileSet class
### Aliases: TabularTextFileSet
### Keywords: classes

### ** Examples

# Setup a file set consisting of all *.dat tab-delimited files
# in a particular directory
path <- system.file("exData/dataSetA,original", package="R.filesets")
ds <- TabularTextFileSet$byPath(path, pattern="[.]dat$")
print(ds)


# Read column 'y' and a subset of the rows from each of the
# tab-delimited files and combine into a matrix
rows <- c(3:5, 8, 2)
data <- extractMatrix(ds, column="y", colClass="integer", rows=rows)
print(data)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# See also help("readDataFrame.TabularTextFileSet")
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ADVANCED: Translation of fullnames
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fnts <- TabularTextFileSet$byPath(getPath(ds), pattern=",fullnames[.]txt$")
appendFullNamesTranslator(ds, as.list(fnts))

cat("Default fullnames:\n")
print(head(getFullNames(ds, translate=FALSE)))
cat("Translated fullnames:\n")
print(head(getFullNames(ds)))

cat("Default fullnames:\n")
print(getFullNames(ds, translate=FALSE))
cat("Translated fullnames:\n")
print(getFullNames(ds))



