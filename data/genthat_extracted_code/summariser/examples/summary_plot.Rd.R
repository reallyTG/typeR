library(summariser)


### Name: summary_plot
### Title: summary_plot
### Aliases: summary_plot

### ** Examples

data(iris)
sum1 <- summary_stats(iris, measure = "Sepal.Length", Species)
summary_plot(sum1, x="Species", colour="Species")



