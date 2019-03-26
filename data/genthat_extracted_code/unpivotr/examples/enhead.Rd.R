library(unpivotr)


### Name: enhead
### Title: Join data cells to headers
### Aliases: enhead

### ** Examples

library(dplyr)
# Load some pivoted data
(x <- purpose$`NNW WNW`)
# Make a tidy representation
cells <- as_cells(x)
cells <- cells[!is.na(cells$chr), ]
head(cells)
# Select the cells containing the values
data_cells <-
  filter(cells, row >= 3, col >= 3) %>%
  transmute(row, col, count = as.integer(chr))
head(data_cells)
# Select the headers
qualification <-
  filter(cells, col == 1) %>%
  select(row, col, qualification = chr)
age <-
  filter(cells, col == 2) %>%
  select(row, col, age = chr)
gender <-
  filter(cells, row == 1) %>%
  select(row, col, gender = chr)
satisfaction <-
  filter(cells, row == 2) %>%
  select(row, col, satisfaction = chr)
# From each data cell, search for the nearest one of each of the headers
data_cells %>%
  enhead(gender, "NNW") %>%
  enhead(satisfaction, "N") %>%
  enhead(qualification, "WNW") %>%
  enhead(age, "W") %>%
  select(-row, -col)

# The `drop` argument controls what happens when for some cells there is no
# header in the given direction. When `drop = TRUE` (the default), cells that
# can't be joined to a header are dropped.  Otherwise they are kept.
enhead(data_cells, gender, "N")
enhead(data_cells, gender, "N", drop = FALSE)



