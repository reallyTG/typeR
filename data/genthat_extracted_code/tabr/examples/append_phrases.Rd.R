library(tabr)


### Name: append_phrases
### Title: Append and duplicate
### Aliases: append_phrases glue dup

### ** Examples

glue(8, "16-", "8^")
dup(1, 2)
x <- phrase("c ec'g' ec'g'", "4 4 2", "5 432 432")
y <- phrase("a", 1, 5)
glue(x, y)
glue(x, dup(y, 2))
glue(x, "r1") # add a simple rest instance
class(glue(x, y))
class(dup(y, 2))
class(glue(x, "r1"))
class(dup("r1", 2))
class(glue("r1", "r4"))



