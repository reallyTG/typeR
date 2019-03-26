library(moonBook)


### Name: compress
### Title: Compress an object of class mytable or cbind.mytable
### Aliases: compress compress.mytable compress.cbind.mytable
###   compress.data.frame

### ** Examples

require(stringr)
require(ztable)
require(magrittr)
mytable(acs) %>% compress
mytable(Dx~.,data=acs) %>% compress
mytable(Dx~.,data=acs) %>% compress %>% ztable
mytable(Dx+sex~.,data=acs) %>% compress



