library(tatoo)


### Name: walk_regions
### Title: Apply a function to all named regions on an openxlsx Workbook
### Aliases: walk_regions map_regions

### ** Examples


x <- iris
title(iris) <- "Iris example table"
wb <- as_workbook(iris)

regions(wb)  # display regions


# Apply a style
# Keep in mind that openxlsx functions modify worksheets by reference.
# If you do not want this behaviour you can use map_regions instead.

style <- openxlsx::createStyle(textDecoration = "bold")
walk_regions(
  wb,
  .pattern = "colnames.*",
  .fun = openxlsx::addStyle,
  style = style
)

## Not run: 
##D   openxlsx::openXL(wb)
## End(Not run)






