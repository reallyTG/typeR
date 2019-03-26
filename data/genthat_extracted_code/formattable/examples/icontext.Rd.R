library(formattable)


### Name: icontext
### Title: Create icon-text elements
### Aliases: icontext

### ** Examples

icontext("plus")
icontext(c("star","star-empty"))
icontext(ifelse(mtcars$mpg > mean(mtcars$mpg), "plus", "minus"), mtcars$mpg)
icontext(list(rep("star",3), rep("star",2)), c("item 1", "item 2"))



