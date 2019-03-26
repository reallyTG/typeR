library(roperators)


### Name: %+=%
### Title: Assignment operators
### Aliases: %+=% %-=% %*=% %/=% %^=% %log=% %root=%

### ** Examples

x <- 1

x %+=% 2

x == 3 # TRUE

x %-=% 3

x == 0 # TRUE

# Or with data frames...
test <- iris

# Simply modify in-place
test$Sepal.Length[test$Species == 'setosa' & test$Petal.Length < 1.5] %+=% 1

# Which is much nicer than typing:
test$Sepal.Length[test$Species == 'setosa' & test$Petal.Length < 1.5] <-
test$Sepal.Length[test$Species == 'setosa' & test$Petal.Length < 1.5] + 1
# ...which is over the 100 character limit for R doccumentation!

# %+=% and %-=% also work with strings

   x <- "ab"

   x %+=% "c"

   x %-=% "b"

   x == "ac" # TRUE

# %-=% can also take regular expressions

   x <- "foobar"

   x %-=% "[f|b]"

   print(x)
   # "ooar"



