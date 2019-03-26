library(rPref)


### Name: complex_pref
### Title: Complex Preferences
### Aliases: &,preference,preference-method &,preference-method
###   *,preference,preference-method *,preference-method
###   +,preference,preference-method +,preference-method complex_pref
###   is.complex_pref reverse |,preference,preference-method
###   |,preference-method

### ** Examples

# define preference for cars with low consumption (high mpg-value) 
# and simultaneously high horsepower
p1 <- high(mpg) * high(hp)  

# perform the preference search
psel(mtcars, p1)

# alternative way: create preference with associated data set
p2 <- high(mpg, df = mtcars) * high(hp)  
peval(p2)



