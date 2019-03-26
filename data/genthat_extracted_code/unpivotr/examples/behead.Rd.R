library(unpivotr)


### Name: behead
### Title: Strip a level of headers from a pivot table
### Aliases: behead behead_if

### ** Examples

# A simple table with a row of headers
(x <- data.frame(a = 1:2, b = 3:4))

# Make a tidy representation of each cell
(cells <- as_cells(x, col_names = TRUE))

# Strip the cells in row 1 (the original headers) and use them as data
behead(cells, "N", foo)

# More complex example: pivot table with several layers of headers
(x <- purpose$`NNW WNW`)

# Make a tidy representation
cells <- as_cells(x)
head(cells)
tail(cells)

# Strip the headers and make them into data
tidy <-
  cells %>%
  behead("NNW", Sex) %>%
  behead("N", `Sense of purpose`) %>%
  behead("WNW", `Highest qualification`) %>%
  behead("W", `Age group (Life-stages)`) %>%
  dplyr::mutate(count = as.integer(chr)) %>%
  dplyr::select(-row, -col, -data_type, -chr)
head(tidy)

# Check against the provided 'tidy' version of the data.
dplyr::anti_join(tidy, purpose$Tidy)

# The provided 'tidy' data is missing a row for Male 15-24-year-olds with a
# postgraduate qualification and a sense of purpose between 0 and 6.  That
# seems to have been an oversight by Statistics New Zealand.

cells <- tibble::tribble(
       ~X1, ~adult, ~juvenile,
    "LION",    855,       677,
    "male",    496,       322,
  "female",    359,       355,
   "TIGER",    690,       324,
    "male",    381,       222,
  "female",    309,       102
  )
cells <- as_cells(cells, col_names = TRUE)

cells %>%
  behead_if(chr == toupper(chr), direction = "WNW", name = "species") %>%
  behead("W", "sex") %>%
  behead("N", "age") %>%
  dplyr::select(species, sex, age, population = dbl)



