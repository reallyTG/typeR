library(statar)


### Name: stat_binmean
### Title: Plot the mean of y over the mean of x within bins of x.
### Aliases: stat_binmean

### ** Examples

library(ggplot2)
g <- ggplot(iris, aes(x = Sepal.Width , y = Sepal.Length)) 
g + stat_binmean(n = 10)
g + stat_binmean(n = 10) + stat_smooth(method = "lm", se = FALSE)
g + stat_binmean(n = 0) 
g <- ggplot(iris, aes(x = Sepal.Width , y = Sepal.Length, color = Species))
g + stat_binmean(n = 10)
g + stat_binmean(n = 10) + stat_smooth(method = "lm", se = FALSE)



