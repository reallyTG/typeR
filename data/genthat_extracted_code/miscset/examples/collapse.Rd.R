library(miscset)


### Name: collapse
### Title: Collapse objects
### Aliases: collapse collapse.default collapse.data.frame

### ** Examples

#

### some data

set.seed(12)
s <- s2 <- sample(LETTERS[1:4], 9, replace = TRUE)
s2[1:2] <- rev(s2[1:2])
d <- data.frame(group = rep(letters[c(3,1,2)], each = 3), 
                value = s,
                level = factor(s2),
                stringsAsFactors = FALSE)

### collapse vectors

collapse(letters)
collapse(1:3)               # coerced to character
collapse(LETTERS[1:5], "-") # separated by '-'

### collapse data.frames

# by all columns (same as unique)
collapse(d)
# by a grouping column
collapse(d, by = 1)
# by multiple, but not all columns
collapse(d, by = c("group", "value"))
# return single row
collapse(d, by = 0)
# return single row, unique and sorted values
collapse(d, by = 0, .unique = TRUE, .sort = TRUE)

#



