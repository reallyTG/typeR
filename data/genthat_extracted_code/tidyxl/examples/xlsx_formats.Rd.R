library(tidyxl)


### Name: xlsx_formats
### Title: Import xlsx (Excel) formatting definitions.
### Aliases: xlsx_formats

### ** Examples

examples <- system.file("extdata/examples.xlsx", package = "tidyxl")
str(xlsx_formats(examples))

# The formats of particular cells can be retrieved like this:

cells <- xlsx_cells(examples)
formats <- xlsx_formats(examples)

formats$local$font$bold[cells$local_format_id]
formats$style$font$bold[cells$style_format]

# To filter for cells of a particular format, first filter the formats to get
# the relevant indices, and then filter the cells by those indices.
bold_indices <- which(formats$local$font$bold)
cells[cells$local_format_id %in% bold_indices, ]



