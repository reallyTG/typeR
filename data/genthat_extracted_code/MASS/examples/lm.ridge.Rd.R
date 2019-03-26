library(MASS)


### Name: lm.ridge
### Title: Ridge Regression
### Aliases: lm.ridge plot.ridgelm print.ridgelm select select.ridgelm
### Keywords: models

### ** Examples

longley # not the same as the S-PLUS dataset
names(longley)[1] <- "y"
lm.ridge(y ~ ., longley)
plot(lm.ridge(y ~ ., longley,
              lambda = seq(0,0.1,0.001)))
select(lm.ridge(y ~ ., longley,
               lambda = seq(0,0.1,0.0001)))



