library(RecordLinkage)


### Name: strcmp
### Title: String Metrics
### Aliases: strcmp jarowinkler jaro winkler levenshtein levenshteinDist
###   levenshteinSim
### Keywords: misc

### ** Examples

# compare two strings:
jarowinkler("Andreas","Anreas")
# compare one string with several others:
levenshteinSim("Andreas",c("Anreas","Andeas"))
# compare two vectors of strings:
jarowinkler(c("Andreas","Borg"),c("Andreas","Bork"))



