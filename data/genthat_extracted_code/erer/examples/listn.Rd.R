library(erer)


### Name: listn
### Title: Generate a list object with names
### Aliases: listn
### Keywords: manip

### ** Examples


y1 <- 1:10
y2 <- c("a", "b")
listn(y1, y2)
listn(y1 = y1, y2)
listn(y1 = y1, y2.rev = y2, y2, 5:8, c("d", "f"))

identical(listn(y1, y2), listn(y1 = y1, y2))        # TRUE
identical(listn(y1, y2), list(y1 = y1, y2))        # FALSE
identical(listn(y1, y2), list(y1 = y1, y2=y2))     # TRUE



