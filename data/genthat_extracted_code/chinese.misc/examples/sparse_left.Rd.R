library(chinese.misc)


### Name: sparse_left
### Title: Check How many Words are Left under Certain Sparse Values
### Aliases: sparse_left

### ** Examples

x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water")
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
y <- sparse_left(dtm, seq(0, 1, 0.1))
# Then you can use plot(sort(y, decreasing = TRUE), type = "b") to 
# see which sparse value is proper.



