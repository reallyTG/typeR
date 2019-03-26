library(chinese.misc)


### Name: dictionary_dtm
### Title: Making DTM/TDM for Groups of Words
### Aliases: dictionary_dtm

### ** Examples

x <- c(
  "Hello, what do you want to drink and eat?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water", 
  "eat a cake", 
  "eat a piece of pizza"
)
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
D1 <- list(
  aa <- c("drink", "eat"),
  bb <- c("cake", "pizza"),
  cc <- c("cup", "bottle")
)
y1 <- dictionary_dtm(dtm, D1, return_dictionary = TRUE)
#
# NA, duplicated words, non-existent words, 
# non-character elements do not affect the
# result.
D2 <-list(
  has_na <- c("drink", "eat", NA),
  this_is_factor <- factor(c("cake", "pizza")),
  this_is_duplicated <- c("cup", "bottle", "cup", "bottle"), 
  do_not_exist <- c("tiger", "dream")
)
y2 <- dictionary_dtm(dtm, D2, return_dictionary = TRUE)
#
# You can read into a data.frame 
# dictionary from a csv file.
# Each column represents a group.
D3 <- data.frame(
  aa <- c("drink", "eat", NA, NA),
  bb <- c("cake", "pizza", NA, NA),
  cc <- c("cup", "bottle", NA, NA),
  dd <- c("do", "to", "of", "and")
)
y3 <- dictionary_dtm(dtm, D3, simple_sum = TRUE)
#
# If it is a matrix:
mt <- t(as.matrix(dtm))
y4 <- dictionary_dtm(mt, D3, type = "t", return_dictionary = TRUE)



