library(ezpickr)


### Name: view
### Title: Seamlessly manipulate any rectangular data file between an Excel
###   window and R session.
### Aliases: view
### Keywords: internal

### ** Examples

if(interactive()) {
library(ezpickr)
data(airquality)
str(airquality)
## View your data object in your spreadsheet software:
view(airquality)
# Then, when necessary, you can modify the opened data in the spreadsheet and save it as a new data.

# You can pass a list object to the `view()` function like below:
l <- list(iris = iris, mtcars = mtcars, chickwts = chickwts, quakes = quakes)
view(l)
# Then, each list item will appear in your Excel window sheet by sheet.
}



