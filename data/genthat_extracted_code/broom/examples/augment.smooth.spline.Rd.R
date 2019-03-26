library(broom)


### Name: augment.smooth.spline
### Title: Tidy a(n) smooth.spline object
### Aliases: augment.smooth.spline smooth.spline_tidiers

### ** Examples


spl <- smooth.spline(mtcars$wt, mtcars$mpg, df = 4)
augment(spl, mtcars)
augment(spl)  # calls original columns x and y

library(ggplot2)
ggplot(augment(spl, mtcars), aes(wt, mpg)) +
    geom_point() + geom_line(aes(y = .fitted))




