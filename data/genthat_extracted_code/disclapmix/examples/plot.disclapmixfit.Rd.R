library(disclapmix)


### Name: plot.disclapmixfit
### Title: Plot a disclapmixfit
### Aliases: plot.disclapmixfit
### Keywords: plot

### ** Examples


data(danes)
db <- as.matrix(danes[rep(1:nrow(danes), danes$n), 1:(ncol(danes)-1)])
fit <- disclapmix(db, clusters = 4L)
plot(fit)




