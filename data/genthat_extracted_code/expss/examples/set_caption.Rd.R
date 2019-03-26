library(expss)


### Name: set_caption
### Title: Add caption to the table
### Aliases: set_caption get_caption is.with_caption

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
tbl_with_caption = calc_cro(mtcars, am, vs) %>% 
    set_caption("Table 1. Type of transimission.")
    
tbl_with_caption




