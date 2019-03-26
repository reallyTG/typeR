library(formattable)


### Name: format_table
### Title: Format a data frame with formatter functions
### Aliases: format_table

### ** Examples

# mtcars (mpg in red)
format_table(mtcars,
   list(mpg = formatter("span", style = "color:red")))

# mtcars (mpg in red if greater than median)
format_table(mtcars, list(mpg = formatter("span",
   style = function(x) ifelse(x > median(x), "color:red", NA))))

# mtcars (mpg in red if greater than median, using formula)
format_table(mtcars, list(mpg = formatter("span",
   style = x ~ ifelse(x > median(x), "color:red", NA))))

# mtcars (mpg in gradient: the higher, the redder)
format_table(mtcars, list(mpg = formatter("span",
   style = x ~ style(color = rgb(x/max(x), 0, 0)))))

# mtcars (mpg background in gradient: the higher, the redder)
format_table(mtcars, list(mpg = formatter("span",
   style = x ~ style(display = "block",
   "border-radius" = "4px",
   "padding-right" = "4px",
   color = "white",
   "background-color" = rgb(x/max(x), 0, 0)))))

# mtcars (mpg in red if vs == 1 and am == 1)
format_table(mtcars, list(mpg = formatter("span",
    style = ~ style(color = ifelse(vs == 1 & am == 1, "red", NA)))))

# hide columns
format_table(mtcars, list(mpg = FALSE, cyl = FALSE))

# area formatting
format_table(mtcars, list(area(col = vs:carb) ~ formatter("span",
  style = x ~ style(color = ifelse(x > 0, "red", NA)))))

df <- data.frame(a = rnorm(10), b = rnorm(10), c = rnorm(10))
format_table(df, list(area() ~ color_tile("transparent", "lightgray")))
format_table(df, list(area(1:5) ~ color_tile("transparent", "lightgray")))
format_table(df, list(area(1:5) ~ color_tile("transparent", "lightgray"),
  area(6:10) ~ color_tile("transparent", "lightpink")))



