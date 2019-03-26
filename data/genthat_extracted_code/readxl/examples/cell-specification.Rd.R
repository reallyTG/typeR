library(readxl)


### Name: cell-specification
### Title: Specify cells for reading
### Aliases: cell-specification cell_limits cell_rows cell_cols anchored

### ** Examples

path <- readxl_example("geometry.xls")
## Rows 1 and 2 are empty (as are rows 7 and higher)
## Column 1 aka "A" is empty (as are columns 5 of "E" and higher)

# By default, the populated data cells are "shrink-wrapped" into a
# minimal data frame
read_excel(path)

# Specific rectangle that is subset of populated cells, possibly improper
read_excel(path, range = "B3:D6")
read_excel(path, range = "C3:D5")

# Specific rectangle that forces inclusion of unpopulated cells
read_excel(path, range = "A3:D5")
read_excel(path, range = "A4:E5")
read_excel(path, range = "C5:E7")

# Anchor a rectangle of specified size at a particular cell
read_excel(path, range = anchored("C4", dim = c(3, 2)), col_names = FALSE)

# Specify only the rows or only the columns
read_excel(path, range = cell_rows(3:6))
read_excel(path, range = cell_cols("C:D"))
read_excel(path, range = cell_cols(2))

# Specify exactly one row or column bound
read_excel(path, range = cell_rows(c(5, NA)))
read_excel(path, range = cell_rows(c(NA, 4)))
read_excel(path, range = cell_cols(c("C", NA)))
read_excel(path, range = cell_cols(c(NA, 2)))

# General open rectangles
# upper left = C4, everything else unspecified
read_excel(path, range = cell_limits(c(4, 3), c(NA, NA)))
# upper right = D4, everything else unspecified
read_excel(path, range = cell_limits(c(4, NA), c(NA, 4)))




