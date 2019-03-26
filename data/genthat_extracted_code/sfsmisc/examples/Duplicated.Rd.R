library(sfsmisc)


### Name: Duplicated
### Title: Counting-Generalization of duplicated()
### Aliases: Duplicated
### Keywords: manip

### ** Examples

x <- c(9:12, 1:4, 3:6, 0:7)
data.frame(x, dup = duplicated(x),
              dupL= duplicated(x, fromLast=TRUE),
              Dup = Duplicated(x),
              DupL= Duplicated(x, fromLast=TRUE))



