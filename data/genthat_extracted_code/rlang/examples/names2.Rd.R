library(rlang)


### Name: names2
### Title: Get names of a vector
### Aliases: names2

### ** Examples

names2(letters)

# It also takes care of standardising missing names:
x <- set_names(1:3, c("a", NA, "b"))
names2(x)



