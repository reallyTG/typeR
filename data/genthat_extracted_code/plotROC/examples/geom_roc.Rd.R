library(plotROC)


### Name: GeomRoc
### Title: Empirical Receiver Operating Characteristic Curve
### Aliases: GeomRoc geom_roc
### Keywords: datasets

### ** Examples

D.ex <- rbinom(50, 1, .5)
rocdata <- data.frame(D = c(D.ex, D.ex), 
                   M = c(rnorm(50, mean = D.ex, sd = .4), rnorm(50, mean = D.ex, sd = 1)), 
                   Z = c(rep("A", 50), rep("B", 50)))

ggplot(rocdata, aes(m = M, d = D)) + geom_roc()
## No test: 
ggplot(rocdata, aes(m = M, d = D, color = Z)) + geom_roc()
ggplot(rocdata, aes(m = M, d = D)) + geom_roc() + facet_wrap(~ Z)
ggplot(rocdata, aes(m = M, d = D)) + geom_roc(n.cuts = 20)
ggplot(rocdata, aes(m = M, d = D)) + geom_roc(cutoffs.at = c(1.5, 1, .5, 0, -.5))
ggplot(rocdata, aes(m = M, d = D)) + geom_roc(labels = FALSE)
ggplot(rocdata, aes(m = M, d = D)) + geom_roc(size = 1.25)
## End(No test)



