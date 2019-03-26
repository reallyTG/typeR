library(remoter)


### Name: rpng
### Title: rpng
### Aliases: rpng rpng.new rpng.off dev.off

### ** Examples

## Not run: 
##D ### Prompts are listed to clarify when something is eval'd locally vs
##D ### remotely
##D > # suppressMessages(library(remoter, quietly = TRUE))
##D > # client()
##D > remoter::client("192.168.56.101")
##D 
##D remoter> plot(1:5)
##D remoter> rpng.off()
##D 
##D remoter> rpng()
##D remoter> plot(iris$Sepal.Length, iris$Petal.Length)
##D remoter> rpng.off()
##D 
##D remoter> library(ggplot2)
##D remoter> g1 <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length,
##D remoter+              color = Species)) +
##D remoter+       geom_point(aes(shape = Species))
##D remoter> rpng()
##D remoter> print(g1)
##D remoter> rpng.off()
##D 
##D remoter> g1 + geom_smooth(method = "lm")
##D 
##D remoter> rpng.new(plot(1:5))
##D 
##D remoter> rpng.new(g1)
##D 
##D remoter> b <- function() plot(iris$Sepal.Length, iris$Petal.Length)
##D remoter> rpng.new(b)
##D 
##D remoter> da <- data.frame(x = rnorm(100), y = rnorm(100))
##D remoter> g2 <- ggplot(da, aes(x, y)) + geom_point()
##D remoter> g2
##D 
##D remoter> pdf()
##D remoter> g2
##D remoter> print(g2 + geom_line())
##D remoter> dev.off()
##D 
##D remoter> q()
##D >
## End(Not run)




