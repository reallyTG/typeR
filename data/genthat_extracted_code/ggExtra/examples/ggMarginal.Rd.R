library(ggExtra)


### Name: ggMarginal
### Title: Add marginal density/histogram to ggplot2 scatterplots
### Aliases: ggMarginal

### ** Examples

library(ggplot2)

# basic usage
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()
ggMarginal(p)

# using some parameters
set.seed(30)
df <- data.frame(x = rnorm(500, 50, 10), y = runif(500, 0, 50))
p2 <- ggplot(df, aes(x, y)) + geom_point()
ggMarginal(p2)
ggMarginal(p2, type = "histogram")
ggMarginal(p2, margins = "x")
ggMarginal(p2, size = 2)
ggMarginal(p2, colour = "red")
ggMarginal(p2, colour = "red", xparams = list(colour = "blue", size = 3))
ggMarginal(p2, type = "histogram", bins = 10)

# Using violin plot
ggMarginal(p2, type = "violin")

# specifying the data directly instead of providing a plot
ggMarginal(data = df, x = "x", y = "y")

# more examples showing how the marginal plots are properly aligned even when
# the main plot axis/margins/size/etc are changed
set.seed(30)
df2 <- data.frame(x = c(rnorm(250, 50, 10), rnorm(250, 100, 10)),
                  y = runif(500, 0, 50))
p2 <- ggplot(df2, aes(x, y)) + geom_point()
ggMarginal(p2)

p2 <- p2 + ggtitle("Random data") + theme_bw(30)
ggMarginal(p2)

p3 <- ggplot(df2, aes(log(x), y - 500)) + geom_point()
ggMarginal(p3)

p4 <- p3 + scale_x_continuous(limits = c(2, 6)) + theme_bw(50)
ggMarginal(p4)

# Using groupColour and groupFill
# In order to use either of these arguments, we must map 'colour' in the
# scatter plot to a factor or character variable
p <- ggplot(mtcars, aes(x = wt, y = drat, colour = factor(vs))) +
     geom_point()
ggMarginal(p, groupColour = TRUE)
ggMarginal(p, groupColour = TRUE, groupFill = TRUE)




