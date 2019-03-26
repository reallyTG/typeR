library(chinese.misc)


### Name: DEFAULT_cutter
### Title: A Default Cutter
### Aliases: DEFAULT_cutter
### Keywords: datasets

### ** Examples

require(jiebaR)
x <- c("drink a bottle of milk", 
  "drink a cup of coffee", 
 "drink some water")
seg_file(x, from = "v")
seg_file(x, from = "v", mycutter = DEFAULT_cutter)



