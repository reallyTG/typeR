library(SSBtools)


### Name: RowGroups
### Title: Create numbering according to unique rows
### Aliases: RowGroups

### ** Examples

a <- data.frame(x = c("a", "b"), y = c("A", "B", "A"), z = rep(1:4, 3))
RowGroups(a)
RowGroups(a, TRUE)
RowGroups(a[, 1:2], TRUE, TRUE)
RowGroups(a[, 1, drop = FALSE], TRUE)



