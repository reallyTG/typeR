library(ztable)


### Name: totalLeft
### Title: Arrange total column to the left
### Aliases: totalLeft

### ** Examples

require(moonBook)
require(ztable)
require(magrittr)
mytable(sex~.,data=acs,show.total=TRUE) %>% ztable %>% totalLeft
mytable(sex+Dx~.,data=acs,show.total=TRUE) %>% ztable %>% totalLeft



