library(ddpcr)


### Name: move_front
### Title: Move columns to the front of a data.frame
### Aliases: move_front
### Keywords: internal

### ** Examples

df <- data.frame(a = character(0), b = character(0), c = character(0))
move_front(df, "b")
move_front(df, c("c", "b"))



