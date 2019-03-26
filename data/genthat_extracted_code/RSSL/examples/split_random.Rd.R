library(RSSL)


### Name: split_random
### Title: Randomly split dataset in multiple parts
### Aliases: split_random

### ** Examples

library(dplyr)

df <- generate2ClassGaussian(200,d=2)
dfs <- df %>% split_random(Class~.,split=c(0.5,0.3,0.2),min_class=1) 
names(dfs) <- c("Train","Validation","Test")
lapply(dfs,summary)




