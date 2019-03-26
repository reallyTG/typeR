library(thinkr)


### Name: replace_pattern
### Title: Replace pattern everywhere in a data.frame
### Aliases: replace_pattern

### ** Examples

library(dplyr)
library(tidyr)
dataset <-
data.frame(a=as.factor(letters)[1:7],b=letters[1:7],c=1:7,stringsAsFactors = FALSE) %>%
unite("fus",a,b,remove=FALSE,sep="")
dataset %>% replace_pattern("a",'"XXX') %>% summary()







