library(expss)


### Name: split_labels
### Title: Split character vector to matrix/split columns in data.frame
### Aliases: split_labels split_columns split_table_to_df make_subheadings

### ** Examples

data(mtcars)

# apply labels
mtcars = apply_labels(mtcars,
    cyl = "Number of cylinders",
    vs = "Engine",
    vs = c("V-engine" = 0,
                    "Straight engine" = 1),
    am = "Transmission",
    am = c(automatic = 0,
                    manual=1),
    gear = "Number of forward gears",
    carb = "Number of carburetors"
)

# all row labels in the first column
tabl = mtcars %>% 
       calculate(cro_cpct(list(cyl, gear, carb), list(total(), vs, am)))

tabl # without subheadings

make_subheadings(tabl) # with subheadings
              
split_labels(tabl[[1]])
split_labels(colnames(tabl))

# replace first column with new columns 
split_columns(tabl) # remove repeated

split_columns(tabl, remove_repeated = FALSE)

split_columns(tabl)

split_table_to_df(tabl)

split_table_to_df(tabl)





