library(dataRetrieval)


### Name: stateCdLookup
### Title: State code look up
### Aliases: stateCdLookup

### ** Examples

fullName <- stateCdLookup("wi", "fullName")
abbriev <- stateCdLookup("Wisconsin", "postal")
id <- stateCdLookup("WI", "id")
name <- stateCdLookup(55, "fullName")
index <- stateCdLookup("WI", "tableIndex")
stateCd[index,]
stateCdLookup(c("West Virginia", "Wisconsin", 55, "MN"))



