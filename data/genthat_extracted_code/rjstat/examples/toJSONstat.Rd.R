library(rjstat)


### Name: toJSONstat
### Title: Convert data frame(s) to JSON-stat format
### Aliases: toJSONstat

### ** Examples

library(reshape)
irises <- melt(cbind(iris, Specimen=rep(1:50, 3)),
               id.vars=c("Species", "Specimen"))
irisJSONstat <- toJSONstat(list(iris=irises))
cat(substr(irisJSONstat, 1, 76))

# Add indentation whitespace
toJSONstat(as.data.frame(Titanic), value = "Freq", pretty = TRUE)



