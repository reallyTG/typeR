library(bazar)


### Name: as.na
### Title: Transform values to NA
### Aliases: as.na as.na.default as.na.data.frame as.na.list

### ** Examples

x <- c("a", "b", "c")
as.na(x)
class(as.na(x)) # still a character

x <- factor(LETTERS)
as.na(x)        # levels are kept
class(as.na(x)) # still a factor

x <- data.frame(x = 1:3, y = 2:4)
as.na(x)
dim(as.na(x))

x <- matrix(1:6, 2, 3)
attr(x, "today") <- Sys.Date()
as.na(x)        # attributes are kept




