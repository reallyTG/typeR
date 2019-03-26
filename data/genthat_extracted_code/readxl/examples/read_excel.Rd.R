library(readxl)


### Name: read_excel
### Title: Read xls and xlsx files
### Aliases: read_excel read_xls read_xlsx

### ** Examples

datasets <- readxl_example("datasets.xlsx")
read_excel(datasets)

# Specify sheet either by position or by name
read_excel(datasets, 2)
read_excel(datasets, "mtcars")

# Skip rows and use default column names
read_excel(datasets, skip = 148, col_names = FALSE)

# Recycle a single column type
read_excel(datasets, col_types = "text")

# Specify some col_types and guess others
read_excel(datasets, col_types = c("text", "guess", "numeric", "guess", "guess"))

# Accomodate a column with disparate types via col_type = "list"
df <- read_excel(readxl_example("clippy.xlsx"), col_types = c("text", "list"))
df
df$value
sapply(df$value, class)

# Limit the number of data rows read
read_excel(datasets, n_max = 3)

# Read from an Excel range using A1 or R1C1 notation
read_excel(datasets, range = "C1:E7")
read_excel(datasets, range = "R1C2:R2C5")

# Specify the sheet as part of the range
read_excel(datasets, range = "mtcars!B1:D5")

# Read only specific rows or columns
read_excel(datasets, range = cell_rows(102:151), col_names = FALSE)
read_excel(datasets, range = cell_cols("B:D"))

# Get a preview of column names
names(read_excel(readxl_example("datasets.xlsx"), n_max = 0))



