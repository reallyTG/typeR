library(metamer)


### Name: delayed_with
### Title: Apply expressions to data.frames
### Aliases: delayed_with

### ** Examples

some_stats <- delayed_with(mean_x = mean(x), mean(y), sd(x), coef(lm(x ~ y)))
data <- data.frame(x = rnorm(20) , y = rnorm(20))
some_stats(data)




