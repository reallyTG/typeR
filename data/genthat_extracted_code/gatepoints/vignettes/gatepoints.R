## ----simpleplot, fig.show = 'hold', fig.cap = 'Simple plot.', fig.width = 6, fig.height = 6, dev = "svg"----
x <- data.frame(x=1:10, y=1:10, row.names = 1:10)
## If you are using RStudio do X11() first.
plot(x, pch = 16, col = "red")

## ---- echo=TRUE, eval = FALSE--------------------------------------------
#  library(gatepoints)
#  selectedPoints <- fhs(x, mark = TRUE)

## ---- echo = FALSE, eval = TRUE------------------------------------------
selectedPoints <- c("4", "5", "7")

## ----gatedplot, echo=FALSE, eval = TRUE, fig.show = 'hold', fig.cap = 'Selected points', fig.width = 6, fig.height = 6, dev = "svg"----
plot(x, pch = 16, col = "red")
x <- rbind(c(6.099191, 8.274120), 
           c(8.129107, 7.048649),
           c(8.526881, 5.859404),
           c(5.700760, 6.716428),
           c(5.605314, 5.953430),
           c(6.866882, 3.764390),
           c(3.313575, 3.344069),
           c(2.417270, 5.217868))
polygon(x[,1], x[,2])
points(c(4,5,7), c(4,5,7))

## ---- echo = FALSE, eval = TRUE------------------------------------------
x <- as.data.frame(x)
colnames(x) <- c("x", "y")
attr(selectedPoints, "gate") <- x

## ---- echo = TRUE, eval = TRUE-------------------------------------------
selectedPoints

