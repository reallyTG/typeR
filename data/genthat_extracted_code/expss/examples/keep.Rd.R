library(expss)


### Name: keep
### Title: Keep or drop elements by name/criteria in data.frame/matrix
### Aliases: keep .keep except .except

### ** Examples

data(iris)
keep(iris, Sepal.Length, Sepal.Width)  
except(iris, Species)

keep(iris, Species, other()) # move 'Species' to the first position
keep(iris, to("Petal.Width")) # keep all columns up to 'Species'

except(iris, perl("^Petal")) # remove columns which names start with 'Petal'

except(iris, 5) # remove fifth column

data(mtcars)
keep(mtcars, from("mpg") & to("qsec")) # keep columns from 'mpg' to 'qsec'
keep(mtcars, mpg %to% qsec) # the same result

 # standard and non-standard evaluation
 many_vars = c("am", "vs", "cyl")
 ## Not run: 
##D  keep(mtcars, many_vars) # error - names not found: 'many_vars'  
##D   
## End(Not run)
 keep(mtcars, (many_vars)) # ok
 
# character expansion
dfs = data.frame(
     a = 10 %r% 5,
     b_1 = 11 %r% 5,
     b_2 = 12 %r% 5,
     b_3 = 12 %r% 5,
     b_4 = 14 %r% 5,
     b_5 = 15 %r% 5 
 )
 i = 1:5
 keep(dfs, b_1 %to% b_5) 
 keep(dfs, subst("b_`i`")) # the same result  



