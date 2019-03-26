library(formattable)


### Name: formatter
### Title: Create a formatter function making HTML elements
### Aliases: formatter

### ** Examples

top10red <- formatter("span",
  style = x ~ ifelse(rank(-x) <= 10, "color:red", NA))
yesno <- function(x) ifelse(x, "yes", "no")
formattable(mtcars, list(mpg = top10red, qsec = top10red, am = yesno))

# format one column by other two columns
# make cyl red for records with both mpg and disp rank <= 20
f1 <- formatter("span",
  style = ~ ifelse(rank(-mpg) <= 20 & rank(-disp) <= 20, "color:red", NA))
formattable(mtcars, list(cyl = f1))



