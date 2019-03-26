library(questionr)


### Name: addNAstr
### Title: Transform missing values of a factor to an extra level
### Aliases: addNAstr

### ** Examples

f <- as.factor(c("a","b",NA,"a","b"))
f
addNAstr(f)
addNAstr(f, value="missing")
addNAstr(f, value=NULL)



