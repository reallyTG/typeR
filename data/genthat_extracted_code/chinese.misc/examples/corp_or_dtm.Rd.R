library(chinese.misc)


### Name: corp_or_dtm
### Title: Create Corpus or Document Term Matrix with 1 Line
### Aliases: corp_or_dtm

### ** Examples

x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water")
# The simplest argument setting
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
# Modify argument control to see what happens
dtm <- corp_or_dtm(x, from = "v", type="d", control = list(wordLengths = c(3, 20)))
tdm <- corp_or_dtm(x, from = "v", type = "T", stop_word = c("you", "to", "a", "of"))



