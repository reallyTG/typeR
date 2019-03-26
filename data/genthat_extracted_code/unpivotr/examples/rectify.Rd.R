library(unpivotr)


### Name: rectify
### Title: Display cells as though in a spreadsheet
### Aliases: rectify print.cell_grid

### ** Examples

x <- data.frame(name = c("Matilda", "Nicholas"),
                score = c(14L, 10L),
                stringsAsFactors = FALSE)

# This is the original form of the table, which is easy to read.
x

# This is the 'tidy' arrangement that is difficult for humans to read (but
# easy for computers)
y <- as_cells(x, col_names = TRUE)
y

# rectify() projects the cells as a spreadsheet again, for humans to read.
rectify(y)

# You can choose to use a particular column of the data
rectify(y, values = chr)
rectify(y, values = int)

# You can also show which row or which column each cell came from, which
# helps with understanding what this function does.
rectify(y, values = row)
rectify(y, values = col)

# Empty rows and columns up to the first occupied cell are dropped, but the
# row and column names reflect the original row and column numbers.
y$row <- y$row + 5
y$col <- y$col + 5
rectify(y)

# Supply named functions to format cell values for display.
rectify(y, formatters = list(chr = toupper, int = ~ . * 10))
#
# Print in the browser or in the RStudio viewer pane
## Not run: 
##D   z <- rectify(y)
##D   print(z, "browser")
##D   print(z, "rstudio")
## End(Not run)



