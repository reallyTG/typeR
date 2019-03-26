library(jtrans)


### Name: predict.sb
### Title: Predict functions for Johnson Transformation
### Aliases: predict.sb predict.sl predict.su

### ** Examples

#' # if you want to predict based on a fitted distribution, you must set the
# parameters in the qtls() function using the fitted model object jt.

jt <- jtrans(rexp(300, .4))

# good prediction
predict(jt, rexp(10, .4))

# will generate NaN because newx is from different distribution
predict(jt, rexp(10, .1))



