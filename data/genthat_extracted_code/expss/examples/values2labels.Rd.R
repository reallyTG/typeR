library(expss)


### Name: values2labels
### Title: Replace vector/matrix/data.frame/list values with corresponding
###   value labels.
### Aliases: values2labels v2l

### ** Examples

data(mtcars)
mtcars = modify(mtcars,{
                var_lab(mpg) = NULL
                val_lab(am) = c(" automatic" = 0, " manual" =  1)
})

summary(lm(mpg ~ ., data = values2labels(mtcars[,c("mpg","am")])))



