library(formattable)


### Name: formattable.data.frame
### Title: Create a formattable data frame
### Aliases: formattable.data.frame

### ** Examples

# mtcars (mpg in red)
formattable(mtcars,
   list(mpg = formatter("span", style = "color:red")))

# mtcars (mpg in red if greater than median)
formattable(mtcars, list(mpg = formatter("span",
   style = function(x) ifelse(x > median(x), "color:red", NA))))

# mtcars (mpg in red if greater than median, using formula)
formattable(mtcars, list(mpg = formatter("span",
   style = x ~ ifelse(x > median(x), "color:red", NA))))

# mtcars (mpg in gradient: the higher, the redder)
formattable(mtcars, list(mpg = formatter("span",
   style = x ~ style(color = rgb(x/max(x), 0, 0)))))

# mtcars (mpg background in gradient: the higher, the redder)
formattable(mtcars, list(mpg = formatter("span",
   style = x ~ style(display = "block",
   "border-radius" = "4px",
   "padding-right" = "4px",
   color = "white",
   "background-color" = rgb(x/max(x), 0, 0)))))

# mtcars (mpg in red if vs == 1 and am == 1)
formattable(mtcars, list(mpg = formatter("span",
    style = ~ style(color = ifelse(vs == 1 & am == 1, "red", NA)))))

# hide columns
formattable(mtcars, list(mpg = FALSE, cyl = FALSE))

# area formatting
formattable(mtcars, list(area(col = vs:carb) ~ formatter("span",
  style = x ~ style(color = ifelse(x > 0, "red", NA)))))

df <- data.frame(a = rnorm(10), b = rnorm(10), c = rnorm(10))
formattable(df, list(area() ~ color_tile("transparent", "lightgray")))
formattable(df, list(area(1:5) ~ color_tile("transparent", "lightgray")))
formattable(df, list(area(1:5) ~ color_tile("transparent", "lightgray"),
  area(6:10) ~ color_tile("transparent", "lightpink")))



