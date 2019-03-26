library(bibliometrix)


### Name: tableTag
### Title: Tabulate elements from a Tag Field column
### Aliases: tableTag

### ** Examples


data(scientometrics)
Tab <- tableTag(scientometrics, Tag = "CR", sep = ";")
Tab[1:10]




