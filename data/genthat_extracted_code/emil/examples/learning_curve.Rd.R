library(emil)


### Name: learning_curve
### Title: Learning curve analysis
### Aliases: learning_curve

### ** Examples

options(emil_max_indent=3)
lc <- learning_curve(c(Linear="lda", Quadratic="qda"),
                     iris[-5], iris$Species, test_fraction=c(.7, .5, .3))
plot(lc)



