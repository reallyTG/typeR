library(tibble)


### Name: enframe
### Title: Converting vectors to data frames, and vice versa
### Aliases: enframe deframe

### ** Examples

enframe(1:3)
enframe(c(a = 5, b = 7))
enframe(list(one = 1, two = 2:3, three = 4:6))
deframe(enframe(1:3))
deframe(tibble(a = 1:3))
deframe(tibble(a = as.list(1:3)))



