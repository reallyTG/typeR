library(rgl)


### Name: rglIds
### Title: rgl id values
### Aliases: lowlevel highlevel rglId rglLowlevel rglHighlevel print.rglId

### ** Examples

x <- matrix(rnorm(30), ncol = 3, dimnames = list(NULL, c("x", "y", "z")))
p <- plot3d(x, type = "s")
str(p)
if (interactive())
  print(p, rglwidget = TRUE)



