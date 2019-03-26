library(bibliometrix)


### Name: keywordAssoc
### Title: ID and DE keyword associations
### Aliases: keywordAssoc

### ** Examples


data(scientometrics)

KWlist <- keywordAssoc(scientometrics, sep = ";",n = 10, excludeKW = NA)

# list of first 10 Keywords plus
names(KWlist)

# list of first 10 authors' keywords associated to the first Keyword plus
KWlist[[1]][1:10]




