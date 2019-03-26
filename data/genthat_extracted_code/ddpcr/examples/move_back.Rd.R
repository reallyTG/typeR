library(ddpcr)


### Name: move_back
### Title: Move columns to the back of a data.frame
### Aliases: move_back
### Keywords: internal

### ** Examples

df <- data.frame(a = character(0), b = character(0), c = character(0))
move_back(df, "b")
move_back(df, c("b", "a"))



