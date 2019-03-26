library(affxparser)


### Name: readChp
### Title: A function to read Affymetrix CHP files
### Aliases: readChp
### Keywords: file IO

### ** Examples

if (require("AffymetrixDataTestFiles")) {
path <- system.file("rawData", package="AffymetrixDataTestFiles")
files <- findFiles(pattern="[.](chp|CHP)$", path=path, 
                   recursive=TRUE, firstOnly=FALSE)

s1 = readChp(files[1])
length(s1)
names(s1)
names(s1[[7]])
}



