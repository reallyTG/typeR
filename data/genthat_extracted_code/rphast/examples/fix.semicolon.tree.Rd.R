library(rphast)


### Name: fix.semicolon.tree
### Title: Add a semi-colon to end of tree string
### Aliases: fix.semicolon.tree

### ** Examples

str <- c("213", "345")
fix.semicolon.tree(str)
str <- c("213;", "345;")
fix.semicolon.tree(str)
str <- c("213", "345;")
fix.semicolon.tree(str)



