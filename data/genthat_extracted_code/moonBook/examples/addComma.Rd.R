library(moonBook)


### Name: addComma
### Title: Change numbers into formatted numbers
### Aliases: addComma addComma.mytable addComma.mytable.df
###   addComma.cbind.mytable addComma.data.frame addComma.character

### ** Examples

require(stringr)
require(ztable)
require(magrittr)
require(ggplot2)
mytable(cut~.,data=diamonds) %>% addComma
x=mytable(Dx~sex,data=acs)
addComma(x)



