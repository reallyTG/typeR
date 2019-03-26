library(forestmangr)


### Name: huberwob
### Title: Calculate the volume without bark of trees using the Huber
###   method
### Aliases: huberwob

### ** Examples

library(forestmangr)
data("exfm8")
exfm8

# Calculate the volume without bark using the Huber method:
huberwob(exfm8,"di_wb", "sec_length", "bark_t", "TREE")

# Using pipes:
library(dplyr)

 exfm8 %>% 
 group_by(TREE) %>% 
 huberwob("di_wb", "sec_length", "bark_t")




