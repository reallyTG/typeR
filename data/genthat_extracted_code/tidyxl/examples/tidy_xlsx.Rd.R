library(tidyxl)


### Name: tidy_xlsx
### Title: Import xlsx (Excel) cell contents into a tidy structure.
### Aliases: tidy_xlsx

### ** Examples

## Not run: 
##D examples <- system.file("extdata/examples.xlsx", package = "tidyxl")
##D 
##D # All sheets
##D str(tidy_xlsx(examples)$data)
##D 
##D # Specific sheet either by position or by name
##D str(tidy_xlsx(examples, 2)$data)
##D str(tidy_xlsx(examples, "Sheet1")$data)
##D 
##D # Data (cell values)
##D x <- tidy_xlsx(examples)
##D str(x$data$Sheet1)
##D 
##D # Formatting
##D str(x$formats$local)
##D 
##D # The formats of particular cells can be retrieved like this:
##D 
##D Sheet1 <- x$data$Sheet1
##D x$formats$style$font$bold[Sheet1$style_format]
##D x$formats$local$font$bold[Sheet1$local_format_id]
##D 
##D # To filter for cells of a particular format, first filter the formats to get
##D # the relevant indices, and then filter the cells by those indices.
##D bold_indices <- which(x$formats$local$font$bold)
##D Sheet1[Sheet1$local_format_id %in% bold_indices, ]
##D 
##D # In-cell formatting is available in the `character_formatted` column as a
##D # data frame, one row per substring.
##D tidy_xlsx(examples)$data$Sheet1$character_formatted[77]
## End(Not run)



