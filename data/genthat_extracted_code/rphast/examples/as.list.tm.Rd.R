library(rphast)


### Name: as.list.tm
### Title: Tree Model to List
### Aliases: as.list.tm

### ** Examples

tm <- tm(tree="((human:0.01, chimp:0.01):0.03, mouse:0.3)",
         subst.mod="JC69")
is.list(tm)
is.list(as.list(tm))



