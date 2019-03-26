library(chinese.misc)


### Name: output_dtm
### Title: Convert or Write DTM/TDM Object Quickly
### Aliases: output_dtm

### ** Examples

require(tm)
x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water")
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
output_dtm(dtm, doc_name = paste("doc", 1:4))



