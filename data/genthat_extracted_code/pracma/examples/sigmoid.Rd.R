library(pracma)


### Name: sigmoid
### Title: Sigmoid Function
### Aliases: sigmoid logit

### ** Examples

x <- seq(-6, 6, length.out = 101)
y1 <- sigmoid(x)
y2 <- sigmoid(x, a = 2)
## Not run: 
##D plot(x, y1, type = "l", col = "darkblue", 
##D         xlab = "", ylab = "", main = "Sigmoid Function(s)")
##D lines(x, y2, col = "darkgreen")
##D grid()
## End(Not run)

# The slope in 0 (in x = b) is a/4
# sigmf with slope 1 and range [-1, 1].
sigmf <- function(x) 2 * sigmoid(x, a = 2) - 1



