library(chinese.misc)


### Name: DEFAULT_control1
### Title: A Default Value for corp_or_dtm 1
### Aliases: DEFAULT_control1
### Keywords: datasets

### ** Examples

require(tm)
x <- c(
  "Hello, what do you want to drink?", 
  "drink a bottle of milk", 
  "drink a cup of coffee", 
  "drink some water")
dtm <- corp_or_dtm(x, from = "v", type = "dtm", control = DEFAULT_control1)



