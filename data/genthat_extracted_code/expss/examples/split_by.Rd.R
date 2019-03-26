library(expss)


### Name: split_by
### Title: Splits data.frame into list of data.frames that can be analyzed
###   separately
### Aliases: split_by split_separate split_off

### ** Examples

# example from base R 'split'
data(airquality)
airquality2 = airquality %>% 
    split_by(Month) %>% 
    compute({
        Ozone_zscore = scale(Ozone)
    }) %>% 
    split_off() 
    
head(airquality2)

# usage of 'groups', 'rownames'
data(mtcars)
# add labels to dataset
mtcars %>% 
    apply_labels(mpg = "Miles/(US) gallon",
                 disp = "Displacement (cu.in.)",
                 wt = "Weight",
                 hp = "Gross horsepower",
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
    ) %>% 
    split_by(am, vs) %>% 
    use_labels({
        res = lm(mpg ~ hp + disp + wt)
        cbind(Coef. = coef(res), confint(res))
    }) %>% 
    split_off(groups = TRUE, rownames = "variable")



