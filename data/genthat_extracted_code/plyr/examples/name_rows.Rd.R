library(plyr)


### Name: name_rows
### Title: Toggle row names between explicit and implicit.
### Aliases: name_rows
### Keywords: manip

### ** Examples

name_rows(mtcars)
name_rows(name_rows(mtcars))

df <- data.frame(a = sample(10))
arrange(df, a)
arrange(name_rows(df), a)
name_rows(arrange(name_rows(df), a))



