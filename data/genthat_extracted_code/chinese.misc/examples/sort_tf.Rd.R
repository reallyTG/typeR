library(chinese.misc)


### Name: sort_tf
### Title: Find High Frequency Terms
### Aliases: sort_tf

### ** Examples

require(tm)
x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water", 
  "hello, drink a cup of coffee")
dtm <- corp_or_dtm(x, from = "v", type = "dtm")
# Argument top is 5, but more than 5 terms are returned
sort_tf(dtm, top = 5)
# Set must_exact to TRUE, return exactly 5 terms
sort_tf(dtm, top=5, must_exact=TRUE)
# Input is a matrix and terms are not specified
m=as.matrix(dtm)
colnames(m)=NULL
mt=t(m)
sort_tf(mt, top=5, type="tdm")



