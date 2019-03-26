library(expss)


### Name: tab_sort_asc
### Title: Partially (inside blocks) sort tables/data.frames
### Aliases: tab_sort_asc tab_sort_desc

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

# without sorting
mtcars %>% calculate(cro_cpct(list(cyl, gear, carb), list("#total", vs, am)))

# with sorting
mtcars %>% 
    calculate(cro_cpct(list(cyl, gear, carb), list("#total", vs, am))) %>% 
    tab_sort_desc
    
# sort by parameter
sorting_column = "Engine|V-engine"

mtcars %>% 
    calculate(cro_cpct(list(cyl, gear, carb), list("#total", vs, am))) %>% 
    tab_sort_desc((sorting_column))
    



