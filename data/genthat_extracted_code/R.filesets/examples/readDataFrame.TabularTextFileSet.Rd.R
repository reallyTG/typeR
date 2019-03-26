library(R.filesets)


### Name: readDataFrame.TabularTextFileSet
### Title: Reads the tabular data from all files as data frames
### Aliases: readDataFrame.TabularTextFileSet
###   TabularTextFileSet.readDataFrame
###   readDataFrame,TabularTextFileSet-method
### Keywords: internal methods IO programming

### ** Examples

# Setup a file set consisting of all *.dat tab-delimited files
# in a particular directory
path <- system.file("exData/dataSetA,original", package="R.filesets")
ds <- TabularTextFileSet$byPath(path, pattern="[.]dat$")
print(ds)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Read data frames from each of the files
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dataList <- lapply(ds, readDataFrame)
print(dataList)

rows <- c(3:5, 8, 2)
dataList <- lapply(ds, readDataFrame, rows=rows)
print(dataList)



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Read common columns and stack into one data frame
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
colNames <- Reduce(intersect, lapply(ds, getColumnNames))
cat("Common column names:\n")
print(colNames)

# Read the *common* columns "as is" (hence 'NA')
colClasses <- rep(NA, times=length(colNames))
names(colClasses) <- colNames
cat("Column class patterns:\n")
print(colClasses)

data <- readDataFrame(ds, colClasses=colClasses)
print(data)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Translate column names on the fly
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
lapply(ds, FUN=setColumnNamesTranslator, function(names, ...) toupper(names))
data <- readDataFrame(ds, colClasses=c("(X|Y)"="integer", "CHAR"="character"))
print(data)



