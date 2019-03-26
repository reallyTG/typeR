library(rPref)


### Name: base_pref
### Title: Base Preferences
### Aliases: base_pref high high_ is.base_pref low low_ true true_

### ** Examples

# define a preference with a score value combining mpg and hp
p1 <- high(4 * mpg + hp)
# perform the preference selection
psel(mtcars, p1)

# define a preference with a given function
f <- function(x, y) (abs(x - mean(x))/max(x) + abs(y - mean(y))/max(y))
p2 <- low(f(mpg, hp))
psel(mtcars, p2)

# use partial evaluation for weighted scoring
p3 <- high(mpg/sum(mtcars$mpg) + hp/sum(mtcars$hp), df = mtcars)
p3
# select Pareto optima
peval(p3)



