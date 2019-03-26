library(spider)


### Name: slidingWindow
### Title: Create windows along an alignment
### Aliases: slidingWindow
### Keywords: Sliding window

### ** Examples


data(woodmouse)
woodmouse <- woodmouse[,1:20]
win1 <- slidingWindow(woodmouse, width = 10)
length(win1)

win2 <- slidingWindow(woodmouse, width = 10, interval = 2)
length(win2)

win3 <- slidingWindow(woodmouse, width = 10, interval = "codons")
length(win3)

win4 <- slidingWindow(woodmouse, width = 15)
length(win4)
attr(win4[[1]], "window")
attr(win4[[2]], "window")




