library(vegtable)


### Name: coverconvert-class
### Title: Cover conversion tables.
### Aliases: coverconvert coverconvert-class
### Keywords: classes

### ** Examples

library(vegtable)
showClass("coverconvert")

## Add a custom scale
Scale <- new("coverconvert")
Scale$my_scale <- list(
	value=factor(c("low","medium","high"), levels=c("low","medium","high")),
	conversion=c(0,50,75,100))
summary(Scale)



