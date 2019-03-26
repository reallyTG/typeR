library(gMWT)


### Name: createGroups
### Title: Renumbering the Group Labels
### Aliases: createGroups
### Keywords: methods

### ** Examples

g <- c(rep(1,5),rep(2,6),rep(3,4))
createGroups(g,c(2,3,1))

# 'Smallest' letter should become 3, second smallest 2 and largest 1:
g <- sample(c("A","B","C"),10,replace=TRUE)
createGroups(g,c(3,2,1))



