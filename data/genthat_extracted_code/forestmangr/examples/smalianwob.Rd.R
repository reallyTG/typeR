library(forestmangr)


### Name: smalianwob
### Title: Calculate the volume without bark of trees using the Smalian
###   method
### Aliases: smalianwob

### ** Examples

library(forestmangr)
data("exfm7")
exfm7

# Calculate the volume without bark using Smalian's method:
smalianwob(exfm7,"di_wb", "hi", "bark_t", "TREE")

# Using pipes:
library(dplyr)

 exfm7 %>% 
 group_by(TREE) %>% 
 smalianwob("di_wb", "hi", "bark_t")




