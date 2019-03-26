library(tweenr)


### Name: tween_fill
### Title: Fill out missing values by interpolation
### Aliases: tween_fill

### ** Examples

# Single vector
tween_fill(c(1, NA, NA, NA, NA, NA, 2, 6, NA, NA, NA, -2), 'cubic-in-out')

# Data frame
tween_fill(mtcars[c(1, NA, NA, NA, NA, 4, NA, NA, NA, 10), ], 'cubic-in')




