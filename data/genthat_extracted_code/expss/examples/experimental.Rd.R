library(expss)


### Name: experimental
### Title: Experimental functions for operations with default dataset
### Aliases: experimental .modify .modify_if .do_if .compute .calculate
###   .calc .val_lab .var_lab .if_val .recode .fre .cro .cro_cases
###   .cro_cpct .cro_rpct .cro_tpct .cro_mean .cro_sum .cro_median
###   .cro_mean_sd_n .cro_fun .cro_fun_df

### ** Examples

data(mtcars)

default_dataset(mtcars) # set mtcars as default dataset

# calculate new variables
.compute({
    mpg_by_am = ave(mpg, am, FUN = mean)
    hi_low_mpg = ifs(mpg<mean(mpg) ~ 0, TRUE ~ 1)    
})

# set labels
.apply_labels(
    mpg = "Miles/(US) gallon",
    cyl = "Number of cylinders",
    disp = "Displacement (cu.in.)",
    hp = "Gross horsepower",
    mpg_by_am = "Average mpg for transimission type",
    hi_low_mpg = "Miles per gallon",
    hi_low_mpg = num_lab("
                     0 Low
                     1 High
                     "),

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
# calculate frequencies
.fre(hi_low_mpg)
.cro(cyl, hi_low_mpg)
.cro_mean(data.frame(mpg, disp, hp), vs)

# disable default dataset
default_dataset(NULL)

# Example of .recode

data(iris)

default_dataset(iris) # set iris as default dataset

.recode(Sepal.Length, lo %thru% median(Sepal.Length) ~ "small", other ~ "large")

.fre(Sepal.Length)

# example of .do_if
 
.do_if(Species == "setosa",{
     Petal.Length = NA
     Petal.Width = NA
})

.cro_mean(data.frame(Petal.Length, Petal.Width), Species)

# disable default dataset
default_dataset(NULL)



