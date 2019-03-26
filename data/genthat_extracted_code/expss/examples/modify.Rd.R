library(expss)


### Name: modify
### Title: Modify data.frame/modify subset of the data.frame
### Aliases: modify compute modify_if do_if calculate use_labels calc
###   %calc% %use_labels% %calculate%

### ** Examples

dfs = data.frame(
    test = 1:5,
    a = rep(10, 5),
    b_1 = rep(11, 5),
    b_2 = rep(12, 5),
    b_3 = rep(13, 5),
    b_4 = rep(14, 5),
    b_5 = rep(15, 5) 
)


# compute sum of b* variables and attach it to 'dfs'
compute(dfs, {
    b_total = sum_row(b_1 %to% b_5)
    var_lab(b_total) = "Sum of b"
    random_numbers = runif(.N) # .N usage
})

# calculate sum of b* variables and return it
calculate(dfs, sum_row(b_1 %to% b_5))


# set values to existing/new variables
compute(dfs, {
    (b_1 %to% b_5) %into% subst('new_b`1:5`')
})

# .new_var usage
compute(dfs, {
    new_var = .new_var()
    new_var[1] = 1 # this is not possible without preliminary variable creation
})

# conditional modification
do_if(dfs, test %in% 2:4, {
    a = a + 1    
    b_total = sum_row(b_1 %to% b_5)
    random_numbers = runif(.N) # .N usage
})


# variable substitution
name1 = "a"
name2 = "new_var"

# example with short notation but it can be applied only for simple cases - 
# when 'name' is vector of length 1
compute(dfs, {
     ..$name2 = ..$name1*2    
})

compute(dfs, {
     for(name1 in paste0("b_", 1:5)){
         name2 = paste0("new_", name1) 
         ..$name2 = ..$name1*2 
     }
     rm(name1, name2) # we don't need this variables as columns in 'dfs'
})

# square brackets notation
compute(dfs, {
     ..[(name2)] = ..[(name1)]*2  
})

compute(dfs, {
     for(name1 in paste0("b_", 1:5)){
         ..[paste0("new_", name1)] = ..$name1*2 
     }
     rm(name1) # we don't need this variable as column in 'dfs'
})

# '..$' doesn't work for case below so we need to use square brackets form
name1 = paste0("b_", 1:5)
name2 = paste0("new_", name1)
compute(dfs, {
     for(i in 1:5){
         ..[name2[i]] = ..[name1[i]]*3
     }
     rm(i) # we don't need this variable as column in 'dfs'
})

# 'use_labels' examples. Utilization of labels in base R.
data(mtcars)
mtcars = apply_labels(mtcars,
                      mpg = "Miles/(US) gallon",
                      cyl = "Number of cylinders",
                      disp = "Displacement (cu.in.)",
                      hp = "Gross horsepower",
                      drat = "Rear axle ratio",
                      wt = "Weight (lb/1000)",
                      qsec = "1/4 mile time",
                      vs = "Engine",
                      vs = c("V-engine" = 0,
                             "Straight engine" = 1),
                      am = "Transmission",
                      am = c("Automatic" = 0,
                             "Manual"=1),
                      gear = "Number of forward gears",
                      carb = "Number of carburetors"
)

use_labels(mtcars, table(am, vs))

## Not run: 
##D use_labels(mtcars, plot(mpg, hp))
## End(Not run)

mtcars %>% 
       use_labels(lm(mpg ~ disp + hp + wt)) %>% 
       summary()




