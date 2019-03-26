library(expss)


### Name: tab_significance_options
### Title: Mark significant differences between columns of the table
### Aliases: tab_significance_options tab_last_sig_cpct tab_last_sig_means
###   tab_last_sig_cases tab_last_round tab_last_add_sig_labels
###   significance_cases significance significance_cpct add_sig_labels
###   significance_means

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

mtcars_table = calculate(mtcars,
                   cro_cpct(list(cyl, gear),
                            list(total(), vs, am))
                         )

significance_cpct(mtcars_table)

# comparison with first column
significance_cpct(mtcars_table, compare_type = "first_column")

# comparison with first column and inside subtable
significance_cpct(mtcars_table, 
            compare_type = c("first_column", "subtable"))

# only significance marks
significance_cpct(mtcars_table, keep = "none")

# means
mtcars_means = calculate(mtcars,
                   cro_mean_sd_n(list(mpg, wt, hp),
                                 list(total(), vs, cyl))
                        )
                        
significance_means(mtcars_means) 

# mark values which are less and greater
significance_means(mtcars_means, subtable_marks = "both")

# chi-squared test
mtcars_cases = calculate(mtcars,
                   cro_cases(list(cyl, gear),
                            list(total(), vs, am))
                         )
                         
significance_cases(mtcars_cases)    

# custom tables with significance
mtcars %>% 
    tab_significance_options(subtable_marks = "both") %>% 
    tab_cells(mpg, hp) %>% 
    tab_cols(total(), vs, am) %>% 
    tab_stat_mean_sd_n() %>% 
    tab_last_sig_means(keep = "means") %>% 
    tab_cells(cyl, gear) %>% 
    tab_stat_cpct() %>% 
    tab_last_sig_cpct() %>% 
    tab_pivot()   
    
# Overcomplicated examples - we move significance marks to
# separate columns. Columns with statistics remain numeric    
mtcars %>% 
    tab_significance_options(keep = "none", 
                         sig_labels = NULL, 
                         subtable_marks = "both",  
                         mode = "append") %>% 
    tab_cols(total(), vs, am) %>% 
    tab_cells(mpg, hp) %>% 
    tab_stat_mean_sd_n() %>% 
    tab_last_sig_means() %>% 
    tab_last_hstack("inside_columns") %>% 
    tab_cells(cyl, gear) %>% 
    tab_stat_cpct() %>% 
    tab_last_sig_cpct() %>% 
    tab_last_hstack("inside_columns") %>% 
    tab_pivot(stat_position = "inside_rows") %>% 
    drop_empty_columns()       



