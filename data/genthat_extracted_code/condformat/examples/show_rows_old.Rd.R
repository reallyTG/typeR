library(condformat)


### Name: show_rows_old
### Title: Selects the rows to be printed (deprecated)
### Aliases: show_rows_old show_rows_

### ** Examples

library(condformat)
data(iris)
x <- head(iris)
condformat(x) + show_rows(Sepal.Length > 4.5, Species == "setosa")
library(condformat)
data(iris)
x <- head(iris)
condformat(x) + show_rows_(.dots = c("Sepal.Length > 4.5", "Species == 'setosa'"))



