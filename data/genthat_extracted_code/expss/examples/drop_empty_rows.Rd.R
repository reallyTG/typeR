library(expss)


### Name: drop_empty_rows
### Title: Drop empty (with all NA's) rows/columns from data.frame/table
### Aliases: drop_empty_rows drop_empty_columns drop_r drop_c drop_rc

### ** Examples

data(mtcars)
mtcars = apply_labels(mtcars,
            vs = "Engine",
            vs = num_lab("
                      0 V-engine 
                      1 Straight engine
                      9 Other
                      "),
            am = "Transmission",
            am = num_lab("
                     0 Automatic 
                     1 Manual
                     9 Other
                     ")
         )
with_empty = calculate(mtcars, cro(am, vs))

drop_empty_rows(with_empty)
drop_empty_columns(with_empty)
drop_rc(with_empty)
                        



