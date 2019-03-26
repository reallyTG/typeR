library(StatMeasures)


### Name: iv
### Title: Information value of an independent variable in predicting a
###   binary response
### Aliases: iv

### ** Examples

# A 'data.frame'
df <- data.frame(x = c('a', 'a', 'a', 'b', 'b', 'b'),
                 y = c(0, 1, 0, 1, 0, 1))

# Information value
IV <- iv(x = df[, 'x'], y = df[, 'y'])



