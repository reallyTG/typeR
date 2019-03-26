library(ipumsr)


### Name: dplyr_select_style
### Title: Select-style helpers from dplyr
### Aliases: dplyr_select_style

### ** Examples

# For microdata, use this syntax to load variables
# Load 3 variables by name
cps_file <- ipums_example("cps_00006.xml")
data <- read_ipums_micro(cps_file, vars = c("YEAR", "MONTH", "PERNUM"))

# Load same 3 variables using bare names
data <- read_ipums_micro(cps_file, vars = c(YEAR, MONTH, PERNUM))

# Use helper functions to load all variables that start with "WT"
data <- read_ipums_micro(cps_file, vars = starts_with("WT"))

# Use bare names and helper function to load YEAR, MONTH and all variables with 'INC' in name
data <- read_ipums_micro(cps_file, vars = c(YEAR, MONTH, contains("INC")))

# For geographic extracts, `data_layer` and `shape_layer` arguments use the same conventions
# to select file names from within zip files.
# (This extract only contains 1 type of file, but some have multiple)
csv_file <- ipums_example("nhgis0008_csv.zip")
data <- read_nhgis(
  csv_file,
  data_layer = contains("pmsa")
)




