library(Ecfun)


### Name: readNIPA
### Title: Read a National Income and Product Accounts data table
### Aliases: readNIPA
### Keywords: IO

### ** Examples

#  Find demoFiles/*.csv
demoDir <- system.file('demoFiles', package='Ecdat')
(demoCsv <- dir(demoDir, pattern='csv$', full.names=TRUE))

nipa6.16 <- readNIPA(demoCsv)
str(nipa6.16)



