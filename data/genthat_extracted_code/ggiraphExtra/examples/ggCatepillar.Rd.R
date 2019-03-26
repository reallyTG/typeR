library(ggiraphExtra)


### Name: ggCatepillar
### Title: Make an interactive catepillar plot
### Aliases: ggCatepillar

### ** Examples

require(moonBook)
require(ggiraph)
require(ggplot2)
ggCatepillar(acs,aes(Dx,age,color=HBP))
ggCatepillar(acs,aes(c(Dx,sex),age,color=HBP),interactive=TRUE,flip=TRUE,use.labels=FALSE)
ggCatepillar(acs,aes(age,height,color=sex),errorbar=FALSE,interactive=TRUE)



