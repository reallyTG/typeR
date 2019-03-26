library(wrapr)


### Name: uniques
### Title: Strict version of unique (without ...).
### Aliases: uniques

### ** Examples


x = c("a", "b")
y = c("b", "c")

# task: get unique items in x plus y
unique(c(x, y))   # correct answer
unique(x, y)      # oops forgot to wrap arguments, quietly get wrong answer
tryCatch(
   uniques(x, y), # uniques catches the error
   error = function(e) { e })
uniques(c(x, y))  # uniques works like base::unique in most case




