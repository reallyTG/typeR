library(expss)


### Name: prepend_values
### Title: Prepend values/variable names to value/variable labels
### Aliases: prepend_values prepend_names prepend_all tab_prepend_values
###   tab_prepend_names tab_prepend_all

### ** Examples

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

# prepend names and 'cro_cpct'
mtcars %>% 
       prepend_names %>% 
       calculate(
              cro_cpct(list(cyl, gear), list(total(), vs, am))
           )
     
# prepend values to value labels                 
mtcars %>% 
   tab_prepend_values %>% 
   tab_cols(total(), vs, am) %>% 
   tab_cells(cyl, gear) %>% 
   tab_stat_cpct() %>% 
   tab_pivot()

# prepend names and labels
mtcars %>% 
   tab_prepend_all %>% 
   tab_cols(total(), vs, am) %>% 
   tab_cells(cyl, gear) %>% 
   tab_stat_cpct() %>% 
   tab_pivot() 
   
# variable in rows without prefixes
mtcars %>% 
   tab_cells(cyl, gear) %>% 
   tab_prepend_all %>% 
   tab_cols(total(), vs, am) %>% 
   tab_stat_cpct() %>% 
   tab_pivot()   



