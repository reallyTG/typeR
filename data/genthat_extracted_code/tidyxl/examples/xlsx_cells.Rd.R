library(tidyxl)


### Name: xlsx_cells
### Title: Import xlsx (Excel) cell contents into a tidy structure.
### Aliases: xlsx_cells

### ** Examples

examples <- system.file("extdata/examples.xlsx", package = "tidyxl")

# All sheets
str(xlsx_cells(examples))

# Specific sheet either by position or by name
str(xlsx_cells(examples, 2))
str(xlsx_cells(examples, "Sheet1"))

# The formats of particular cells can be retrieved like this:

Sheet1 <- xlsx_cells(examples, "Sheet1")
formats <- xlsx_formats(examples)

formats$local$font$bold[Sheet1$local_format_id]
formats$style$font$bold[Sheet1$style_format]

# To filter for cells of a particular format, first filter the formats to get
# the relevant indices, and then filter the cells by those indices.
bold_indices <- which(formats$local$font$bold)
Sheet1[Sheet1$local_format_id %in% bold_indices, ]

# In-cell formatting is available in the `character_formatted` column as a
# data frame, one row per substring.
xlsx_cells(examples)$character_formatted[77]



