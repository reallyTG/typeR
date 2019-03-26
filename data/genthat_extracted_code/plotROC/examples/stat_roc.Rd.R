library(plotROC)


### Name: StatRoc
### Title: Calculate the empirical Receiver Operating Characteristic curve
### Aliases: StatRoc stat_roc
### Keywords: datasets

### ** Examples

D.ex <- rbinom(50, 1, .5)
rocdata <- data.frame(D = c(D.ex, D.ex), 
                   M = c(rnorm(50, mean = D.ex, sd = .4), rnorm(50, mean = D.ex, sd = 1)), 
                   Z = c(rep("A", 50), rep("B", 50)))

ggplot(rocdata, aes(m = M, d = D)) + stat_roc()



