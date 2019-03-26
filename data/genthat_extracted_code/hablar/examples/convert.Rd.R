library(hablar)


### Name: convert
### Title: Convert data type of columns
### Aliases: convert num chr lgl int dbl fct dtm dte

### ** Examples

# Changing a columns to numeric
# and another one to character
convert(mtcars, num(gear),
                chr(mpg))


# Changing multiple data types on multiple columns
convert(mtcars, int(hp,
                    wt),
                fct(qsec,
                    cyl,
                    drat))




