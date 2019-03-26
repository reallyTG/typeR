library(xtable)


### Name: xtableList
### Title: Create and Export Lists of Tables
### Aliases: xtableList print.xtableList
### Keywords: print

### ** Examples

data(mtcars)
mtcars <- mtcars[, 1:6]
mtcarsList <- split(mtcars, f = mtcars$cyl)
attr(mtcarsList, "subheadings") <- paste0("Number of cylinders = ",
                                          names(mtcarsList))
attr(mtcarsList, "message") <- c("Line 1 of Message",
                                 "Line 2 of Message")
xList <- xtableList(mtcarsList)
print.xtableList(xList)
print.xtableList(xList, colnames.format = "multiple")



