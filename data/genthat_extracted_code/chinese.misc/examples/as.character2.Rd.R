library(chinese.misc)


### Name: as.character2
### Title: An Enhanced Version of as.character
### Aliases: as.character2

### ** Examples

as.character2(NULL, NULL)
# Try a list of NULLs
null_list <- list(a = NULL, b = NULL, c = NULL)
# Compare the different results of as.character 
# and as.character2. In fact, we usually 
# want the latter one.
as.character(null_list)
as.character2(null_list)
# Try a list with a data frame in it
df <- data.frame(matrix(c(66,77,NA,99), nrow = 2))
l <- list(a = 1:4, b = factor(c(10,20,NA, 30)), c = c('x', 'y', NA, 'z'), d = df)
as.character2(l)
# Try a list of lists
l2 <- list(l, l, cha = c('a', 'b', 'c'))
as.character2(l2)



