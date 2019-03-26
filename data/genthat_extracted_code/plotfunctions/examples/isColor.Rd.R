library(plotfunctions)


### Name: isColor
### Title: Check whether color specifications exists.
### Aliases: isColor

### ** Examples

# correct color definitions:
isColor(c("#FF0000FF", "#00FF00FF", "#0000FFFF"))
isColor(c('red', 'steelblue', "green3"))
isColor(c(1,7,28))
# mixtures are possible too:
isColor(c("#FF0000FF", "red", 1, "#FF0000", rgb(.1,0,0)))

# return colors:
# note that 28 is converted to 4...
isColor(c(1,7,28), return.colors=TRUE) 
isColor(c("#FF0000CC", "red", 1, "#FF0000"), return.colors=TRUE)

# 4 incorrect colors, 1 correct:
test <- c("#FH0000", 3, "#FF00991", "lavendel", "#AABBCCFFF")
isColor(test)
isColor(test, return.colors=TRUE)




