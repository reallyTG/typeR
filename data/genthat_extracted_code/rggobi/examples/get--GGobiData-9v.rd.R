library(rggobi)


### Name: "[.GGobiData"
### Title: Subsettting
### Aliases: [.GGobiData [[.GGobiData $.GGobiData
### Keywords: manip

### ** Examples

if (interactive()) {

g <- ggobi(mtcars)
x <- g$mtcars
x[1:5, 1:5]
x[[1]]
x$cyl}


