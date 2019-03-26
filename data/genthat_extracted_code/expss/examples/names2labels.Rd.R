library(expss)


### Name: names2labels
### Title: Replace data.frame/list names with corresponding variables
###   labels.
### Aliases: names2labels n2l

### ** Examples

data(mtcars)
mtcars = modify(mtcars,{
                var_lab(mpg) = "Miles/(US) gallon"
                var_lab(cyl) = "Number of cylinders"
                var_lab(disp) = "Displacement (cu.in.)"
                var_lab(hp) = "Gross horsepower"
                var_lab(drat) = "Rear axle ratio"
                var_lab(wt) = "Weight (lb/1000)"
                var_lab(qsec) = "1/4 mile time"
                var_lab(vs) = "V/S"
                var_lab(am) = "Transmission (0 = automatic, 1 = manual)"
                var_lab(gear) = "Number of forward gears"
                var_lab(carb) = "Number of carburetors"
})

# without original names
# note: we exclude dependent variable 'mpg' from conversion to use its short name in formula
summary(lm(mpg ~ ., data = names2labels(mtcars, exclude = "mpg")))
# with names
summary(lm(mpg ~ ., data = names2labels(mtcars, exclude = "mpg", keep_names = TRUE)))



