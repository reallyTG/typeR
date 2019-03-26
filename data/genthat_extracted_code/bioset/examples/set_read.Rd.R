library(bioset)


### Name: set_read
### Title: Read a data set from a data-sheet and turn it into a
###   multi-column tibble.
### Aliases: set_read

### ** Examples

# a file containing only values
read.csv(
  file = system.file("extdata", "values.csv", package = "bioset"),
  header = FALSE,
  colClasses = "character"
)

# read into a tibble
set_read(
  file_name = "values_names.csv",
  path = system.file("extdata", package = "bioset"),
)

# file containing names
read.csv(
  file = system.file("extdata", "values_names.csv", package = "bioset"),
  header = FALSE,
  colClasses = "character"
)

# read a file containing labels and store those in column "name"
set_read(
  file_name = "values_names.csv",
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name")
)

# file with names and properties
read.csv(
  file = system.file(
    "extdata", "values_names_properties.csv", package = "bioset"),
  header = FALSE,
  colClasses = "character"
)

# read a file containing labels and properties and store those in columns
# "name" and "time"
# splits names by every character that's not A-Z, a-z, 0-9
# to change that behaviour use additional_sep
set_read(
  file_name = "values_names_properties.csv",
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name", "time")
)

# read file "set_1.csv" containing labels
set_read(
  num = 1,
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name", "time")
)

# read file "set_2.csv" containing labels
set_read(
  num = 2,
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name", "time")
)

# read file "plate_2.csv" containing labels
set_read(
  num = 2,
  file_name = "plate_#NUM#.csv",
  path = system.file("extdata", package = "bioset"),
  additional_vars = c("name", "time")
)




