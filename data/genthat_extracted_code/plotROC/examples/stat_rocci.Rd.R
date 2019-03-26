library(plotROC)


### Name: StatRocci
### Title: Calculate confidence regions for the empirical ROC curve
### Aliases: StatRocci stat_rocci
### Keywords: datasets

### ** Examples

D.ex <- rbinom(50, 1, .5)
rocdata <- data.frame(D = c(D.ex, D.ex), 
                   M = c(rnorm(50, mean = D.ex, sd = .4), rnorm(50, mean = D.ex, sd = 1)), 
                   Z = c(rep("A", 50), rep("B", 50)))

ggplot(rocdata, aes(m = M, d = D)) + geom_roc() + stat_rocci()
ggplot(rocdata, aes(m = M, d = D)) + geom_roc() + 
stat_rocci(ci.at = quantile(rocdata$M, c(.1, .3, .5, .7, .9)))




