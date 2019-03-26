library(expss)


### Name: cro
### Title: Cross tabulation with support of labels, weights and multiple
###   response variables.
### Aliases: cro cro_cases cro_cpct cro_rpct cro_tpct cro_cpct_responses
###   calc_cro calc_cro_cases calc_cro_cpct calc_cro_rpct calc_cro_tpct
###   calc_cro_cpct_responses total

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

calculate(mtcars, cro(am, vs))
calc_cro(mtcars, am, vs) # the same result

# column percent with multiple banners
calculate(mtcars, cro_cpct(cyl, list(total(), vs, am)))
calc_cro_cpct(mtcars, cyl, list(total(), vs, am)) # the same result

# nested banner
calculate(mtcars, cro_cpct(cyl, list(total(), vs %nest% am)))

# stacked variables
calculate(mtcars, cro(list(cyl, carb), list(total(), vs %nest% am)))

# nested variables
calculate(mtcars, cro_cpct(am %nest% cyl, list(total(), vs)))

# row variables
calculate(mtcars, cro_cpct(cyl, list(total(), vs), row_vars = am))

# several totals above table
calculate(mtcars, cro_cpct(cyl, 
              list(total(), vs), 
              row_vars = am,
              total_row_position = "above",
              total_label = c("number of cases", "row %"),
              total_statistic = c("u_cases", "u_rpct")
              ))

# multiple-choice variable
# brands - multiple response question
# Which brands do you use during last three months? 
set.seed(123)
brands = data.frame(t(replicate(20,sample(c(1:5,NA),4,replace = FALSE))))
# score - evaluation of tested product
score = sample(-1:1,20,replace = TRUE)
var_lab(brands) = "Used brands"
val_lab(brands) = make_labels("
                              1 Brand A
                              2 Brand B
                              3 Brand C
                              4 Brand D
                              5 Brand E
                              ")

var_lab(score) = "Evaluation of tested brand"
val_lab(score) = num_lab("
                             -1 Dislike it
                             0 So-so
                             1 Like it    
                             ")

cro_cpct(mrset(brands), list(total(), score))
# responses
cro_cpct_responses(mrset(brands), list(total(), score))



