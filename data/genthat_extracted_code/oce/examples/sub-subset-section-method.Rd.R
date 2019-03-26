library(oce)


### Name: [[<-,section-method
### Title: Replace Parts of a Section Object
### Aliases: [[<-,section-method

### ** Examples

# 1. Change section ID from a03 to A03
data(section)
section[["sectionId"]]
section[["sectionId"]] <- toupper(section[["sectionId"]])
section[["sectionId"]]
# 2. Add a millidegree to temperatures at station 10
section[["station", 10]][["temperature"]] <-
    1e-3 + section[["station", 10]][["temperature"]]



