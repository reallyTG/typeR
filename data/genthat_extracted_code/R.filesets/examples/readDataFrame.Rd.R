library(R.filesets)


### Name: readDataFrame
### Title: Reads data from a tabular file
### Aliases: readDataFrame.default readDataFrame

### ** Examples

path <- system.file("exData/dataSetA,original", package="R.filesets")

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Example: Standard tab-delimited file with header comments
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pathname <- file.path(path, "fileA,20100112.dat")

# Read all data
df <- readDataFrame(pathname)
print(df)

# Read columns 'x', 'y', and 'char'
df <- readDataFrame(pathname, colClasses=c("(x|y)"="integer", "char"="character"))
print(df)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Example: Tab-delimited file with header comments but
#          also two garbage at the very beginning
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pathname <- file.path(path, "fileA,20130116.datx")

# Explicitly skip the two rows
df <- readDataFrame(pathname, skip=2)
print(df)


# Skip until the first data row
df <- readDataFrame(pathname, skip="^x")
print(df)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Example: Tab-delimited file without column header
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
path <- system.file("exData/dataSetB", package="R.filesets")
pathname <- file.path(path, "fileF,noHeader.dat")

# Incorrectly assuming column header
df <- readDataFrame(pathname)
print(df)

# No column header
df <- readDataFrame(pathname, header=FALSE)
print(df)



