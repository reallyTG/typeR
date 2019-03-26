library(optiRum)


### Name: wordwrap
### Title: Produce a string with one word per line
### Aliases: wordwrap
### Keywords: ggplot

### ** Examples

library('ggplot2')
names <- wordwrap(c("This is a name","Single"))
ggplot(data.frame(x=names,y=1:10),aes(x,y))+theme_optimum()+geom_line()




