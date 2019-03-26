library(chinese.misc)


### Name: seg_file
### Title: Convenient Tool to Segment Chinese Texts
### Aliases: seg_file

### ** Examples

require(jiebaR)
# No Chinese word is allowed, so we use English here.
x <- c("drink a bottle of milk", 
  "drink a cup of coffee", 
 "DRINK SOME WATER")
seg_file(x, from = "v", myfun1 = tolower)



