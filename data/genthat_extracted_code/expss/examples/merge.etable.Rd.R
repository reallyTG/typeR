library(expss)


### Name: merge.etable
### Title: Merge two tables/data.frames
### Aliases: merge.etable %merge%

### ** Examples

data(mtcars)
# apply labels
mtcars = apply_labels(mtcars,
                mpg = "Miles/(US) gallon",
                cyl = "Number of cylinders",
                disp = "Displacement (cu.in.)",
                hp = "Gross horsepower",
                drat = "Rear axle ratio",
                wt = "Weight (lb/1000)",
                qsec = "1/4 mile time",
                vs = "V/S",
                vs = c("V-engine" = 0, "Straight engine" = 1),
                am = "Transmission (0 = automatic, 1 = manual)",
                am = c(automatic = 0, manual = 1),
                gear = "Number of forward gears",
                carb = "Number of carburetors"
)

# table by 'am'
tab1 = calculate(mtcars, cro_cpct(gear, am))
# table with percents
tab2 = calculate(mtcars, cro_cpct(gear, vs))

# combine tables
tab1 %merge% tab2

# complex tables
# table with counts
counts = calculate(mtcars, cro(list(vs, am, gear, carb), list("Count")))
# table with percents
percents = calculate(mtcars, cro_cpct(list(vs, am, gear, carb), list("Column, %")))

# combine tables
counts %merge% percents



