library(forestmangr)


### Name: huberwb
### Title: Calculate the volume with bark of trees using the Huber method
### Aliases: huberwb

### ** Examples

library(forestmangr)
data("exfm8")
exfm8

# Calculate the volume with bark using the Huber method:
huberwb(exfm8,"di_wb", "sec_length", "TREE")

# Using pipes:
library(dplyr)

 exfm8 %>% 
 group_by(TREE) %>% 
 huberwb("di_wb", "sec_length")




