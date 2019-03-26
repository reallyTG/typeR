library(chinese.misc)


### Name: chinese.misc-package
### Title: Miscellaneous Tools for Chinese Text Mining and More
### Aliases: chinese.misc-package chinese.misc

### ** Examples

require(tm)
# Since no Chinese character is allowed, here we 
# use English instead.
# Make a document term matrix in 1 step, few arguments have 
# to be modified by the user.
x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water", 
  "hello, drink a cup of coffee")
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
# Coerce list containing data frames and other lists
df <- data.frame(matrix(c(66, 77, NA, 99), nr = 2))
l <- list(a = 1:4, b = factor(c(10, 20, NA, 30)), c = c('x', 'y', NA, 'z'), d = df)
l2 <- list(l, l, cha = c('a', 'b', 'c'))
as.character2(l2)



