library(emil)


### Name: pre_factor_to_logical
### Title: Convert factors to logical columns
### Aliases: pre_factor_to_logical

### ** Examples

x <- mtcars[-1]
x <- transform(x,
    cyl = factor(cyl, ordered=TRUE),
    vs = factor(vs),
    gear = factor(gear)
)
y <- mtcars$mpg
cv <- resample("crossvalidation", y)
data <- pre_split(x, y, cv[[1]]) %>%
    pre_factor_to_logical(base = c(cyl="4", vs="0"), 
                          drop=c(cyl=FALSE, gear=FALSE))
data$fit$x



