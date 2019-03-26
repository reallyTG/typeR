library(expss)


### Name: cro_fun
### Title: Cross-tabulation with custom summary function.
### Aliases: cro_fun cro_fun_df cro_mean cro_mean_sd_n cro_sum cro_median
###   cro_pearson cro_spearman calc_cro_fun calc_cro_fun_df calc_cro_mean
###   calc_cro_mean_sd_n calc_cro_sum calc_cro_median calc_cro_pearson
###   calc_cro_spearman combine_functions

### ** Examples

data(mtcars)
mtcars = apply_labels(mtcars,
                      mpg = "Miles/(US) gallon",
                      cyl = "Number of cylinders",
                      disp = "Displacement (cu.in.)",
                      hp = "Gross horsepower",
                      drat = "Rear axle ratio",
                      wt = "Weight (1000 lbs)",
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


# Simple example - there is special shortcut for it - 'cro_mean'
calculate(mtcars, cro_fun(list(mpg, disp, hp, wt, qsec), 
                               col_vars = list(total(), am), 
                               row_vars = vs, 
                               fun = mean)
)

# the same result
calc_cro_fun(mtcars, list(mpg, disp, hp, wt, qsec), 
                     col_vars = list(total(), am), 
                     row_vars = vs, 
                     fun = mean
) 

# The same example with 'subgroup'
calculate(mtcars, cro_fun(list(mpg, disp, hp, wt, qsec), 
                               col_vars = list(total(), am), 
                               row_vars = vs,
                               subgroup = vs == 0, 
                               fun = mean)
)
                                
# 'combine_functions' usage  
calculate(mtcars, cro_fun(list(mpg, disp, hp, wt, qsec), 
                          col_vars = list(total(), am), 
                          row_vars = vs, 
                          fun = combine_functions(Mean = mean, 
                                                  'Std. dev.' = sd,
                                                  'Valid N' = valid_n)
))  
# 'combine_functions' usage - statistic labels in columns
calculate(mtcars, cro_fun(list(mpg, disp, hp, wt, qsec), 
                          col_vars = list(total(), am), 
                          row_vars = vs, 
                          fun = combine_functions(Mean = mean, 
                                                  'Std. dev.' = sd,
                                                  'Valid N' = valid_n,
                                                  method = list
                                                  )
)) 

# 'summary' function
calculate(mtcars, cro_fun(list(mpg, disp, hp, wt, qsec), 
                          col_vars = list(total(), am), 
                          row_vars = list(total(), vs), 
                          fun = summary
))  
                          
# comparison 'cro_fun' and 'cro_fun_df'
calculate(mtcars, cro_fun(
                       sheet(mpg, disp, hp, wt, qsec), 
                       col_vars = am,
                       fun = mean
                       )
)

# same result
calculate(mtcars, cro_fun_df(
                       sheet(mpg, disp, hp, wt, qsec), 
                       col_vars = am, 
                       fun = colMeans
                       )
) 

# usage for 'cro_fun_df' which is not possible for 'cro_fun'
# linear regression by groups
calculate(mtcars, cro_fun_df(
                      sheet(mpg, disp, hp, wt, qsec), 
                      col_vars = am,
                      fun = function(x){
                            frm = reformulate(".", response = names(x)[1])
                            model = lm(frm, data = x)
                            sheet(
                                'Coef. estimate' = coef(model), 
                                 confint(model)
                                 )
                      }
))



