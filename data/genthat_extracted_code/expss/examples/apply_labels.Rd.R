library(expss)


### Name: apply_labels
### Title: Set variable labels/value labels on variables in the data.frame
### Aliases: apply_labels apply_var_labs apply_val_labs .apply_labels
###   .apply_val_labs .apply_var_labs

### ** Examples

data(mtcars)
mtcars = apply_labels(mtcars,
                      vs = "Engine",
                      vs = num_lab("
                             0 V-engine 
                             1 Straight engine
                             "),
                      am = "Transmission",
                      am = num_lab("
                             0 Automatic 
                             1 Manual
                             ")
)

# 'table' from base R
table(mtcars$vs, mtcars$am)

# more sofisticated crosstable
calculate(mtcars, cro(vs, am))




