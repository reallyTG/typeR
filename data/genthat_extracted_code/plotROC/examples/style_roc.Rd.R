library(plotROC)


### Name: style_roc
### Title: Add guides and annotations to a ROC plot
### Aliases: style_roc

### ** Examples

D.ex <- rbinom(50, 1, .5)
fakedata <- data.frame(M1 = rnorm(50, mean = D.ex), 
   D = D.ex)
ggplot(fakedata, aes(m = M1, d = D)) + geom_roc() + style_roc()
ggplot(fakedata, aes(m = M1, d = D)) + geom_roc() + style_roc(xlab = "1 - Specificity")
ggplot(fakedata, aes(m = M1, d = D)) + geom_roc() + style_roc(theme = theme_grey)



