library(forestmangr)


### Name: smalianwb
### Title: Calculate the volume with bark of trees using the Smalian method
### Aliases: smalianwb

### ** Examples

library(forestmangr)
data("exfm7")
exfm7

# Calculate the volume with bark using the Smalian method:
smalianwb(exfm7,"di_wb", "hi", "TREE")

# Using pipes:
library(dplyr)

 exfm7 %>% 
 group_by(TREE) %>% 
 smalianwb("di_wb", "hi")




