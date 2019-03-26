library(expss)


### Name: nest
### Title: Compute nested variable(-s) from several variables
### Aliases: nest %nest%

### ** Examples

data(mtcars)

mtcars = apply_labels(mtcars,
                      cyl = "Number of cylinders",
                      vs = "Engine",
                      vs = num_lab("
                             0 V-engine 
                             1 Straight engine
                             "),
                      am = "Transmission",
                      am = num_lab("
                             0 Automatic 
                             1 Manual
                             "),
                      carb = "Number of carburetors"
)

calc(mtcars, cro(cyl, am %nest% vs))

# list of variables
calc(mtcars, cro(cyl, am %nest% list(vs, cyl)))

# list of variables - multiple banners/multiple nesting
calc(mtcars, cro(cyl, list(total(), list(am, vs) %nest% cyl)))

# three variables 
calc(mtcars, cro(am %nest% vs %nest% carb, cyl))

# the same with usual version
calc(mtcars, cro(cyl, nest(am, vs)))

# three variables 
calc(mtcars, cro(nest(am, vs, carb), cyl))



