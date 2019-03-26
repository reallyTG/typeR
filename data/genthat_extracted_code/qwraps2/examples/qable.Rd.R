library(qwraps2)


### Name: qable
### Title: Qable: an extended verion of knitr::kable
### Aliases: qable

### ** Examples

data(mtcars)
qable(mtcars)
qable(mtcars, markup = "markdown")

# by make
make <- sub("^(\\w+)\\s?(.*)$", "\\1", rownames(mtcars))
make <- c(table(make))

# A LaTeX table with a vertical bar between each column
qable(mtcars[sort(rownames(mtcars)), ], rgroup = make) 

# A LaTeX table with no vertical bars between columns
qable(mtcars[sort(rownames(mtcars)), ], rgroup = make, vline = "")

# a markdown table
qable(mtcars[sort(rownames(mtcars)), ], rgroup = make, markup = "markdown")

# define your own column names
qable(mtcars[sort(rownames(mtcars)), ], 
      rgroup = make, 
      cnames = toupper(colnames(mtcars)), 
      markup = "markdown")

# define your own column names and add a title
qable(mtcars[sort(rownames(mtcars)), ], 
      rtitle = "Make & Model",
      rgroup = make, 
      cnames = toupper(colnames(mtcars)), 
      markup = "markdown")




