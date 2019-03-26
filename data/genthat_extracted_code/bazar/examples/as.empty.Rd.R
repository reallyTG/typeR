library(bazar)


### Name: as.empty
### Title: Convert to an empty object
### Aliases: as.empty as.empty.default as.empty.data.frame

### ** Examples

x <- c("a", "b", "c")
as.empty(x)
class(as.empty(x)) # still a character

x <- factor(LETTERS)
as.empty(x)        # levels are kept
class(as.empty(x)) # still a factor

x <- data.frame(x = 1:3, y = 2:4)
as.empty(x)




