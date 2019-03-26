library(expss)


### Name: var_lab
### Title: Set or get variable label
### Aliases: var_lab var_lab<- set_var_lab unvr drop_var_labs
###   add_labelled_class

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
                val_lab(am) = c(automatic = 0, manual=1)
                var_lab(gear) = "Number of forward gears"
                var_lab(carb) = "Number of carburetors"
})

fre(mtcars$am)

calculate(mtcars, 
     cro_mean(list(mpg, disp, hp, qsec), list(total(), am))
     ) 

 
## Not run: 
##D # 'add_labelled_class' example doesn't work intentionally
##D if(FALSE){ # to prevent execution
##D # you need to load packages strictly in this order to avoid conflicts
##D library(haven)
##D library(expss)
##D spss_data = haven::read_spss("spss_file.sav")
##D # add missing 'labelled' class
##D spss_data = add_labelled_class(spss_data) 
##D }
## End(Not run)



