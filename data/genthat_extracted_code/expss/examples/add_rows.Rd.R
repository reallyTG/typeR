library(expss)


### Name: add_rows
### Title: Add rows to data.frame/matrix/table
### Aliases: add_rows add_rows.data.frame %add_rows% .add_rows

### ** Examples

a = data.frame(x = 1:5, y = 6:10)
b = data.frame(y = 6:10, z = 11:15)

add_rows(a, b) # x, y, z
a %add_rows% b # the same result

add_rows(a, b, nomatch_columns = "drop")  # y

# simple tables
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

tbl_mean = calculate(mtcars, cro_mean(cyl, am))
tbl_percent = calculate(mtcars, cro_cpct(cyl, am))

tbl_mean %add_rows% tbl_percent




