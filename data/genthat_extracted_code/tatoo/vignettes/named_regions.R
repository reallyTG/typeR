## ------------------------------------------------------------------------

library(tatoo)


## ---- eval = FALSE-------------------------------------------------------
#  wb <- as_workbook(iris[1:5, ])

## ---- eval = FALSE-------------------------------------------------------
#  style_colnames <- openxlsx::createStyle(textDecoration = "bold", valign = "top")
#  style_body     <- openxlsx::createStyle(textRotation = 10)
#  walk_regions(wb, "colnames", openxlsx::addStyle, style_colnames)
#  walk_regions(wb, "table",    openxlsx::setColWidths, widths = 14)
#  

## ------------------------------------------------------------------------
 show_regions <- function(x){
   unique(regions(as_workbook(x))$region)
 }

## ------------------------------------------------------------------------
show_regions(mash_table(iris, iris))
show_regions(mash_table(iris, iris, mash_method = "col"))
show_regions(comp_table(iris, iris))
show_regions(stack_table(iris, iris))
show_regions(tag_table(
  iris, 
  tt_meta(
    table_id = "tab1", 
    title = "a title", 
    footer = "blahblubb")
))


## ---- results = "hide"---------------------------------------------------

x <- mash_table(
  iris[1:2, ], 
  iris[1:2, ],
  meta = tt_meta(table_id = "iris", title = "example table")
) 
wb <- as_workbook(x)

style_iris     <- openxlsx::createStyle(fgFill = "pink")
style_header   <- openxlsx::createStyle(textDecoration = "italic")
style_colnames <- openxlsx::createStyle(textDecoration = "bold", valign = "top")
style_body     <- openxlsx::createStyle(textRotation = 10)


walk_regions(wb, "iris", openxlsx::addStyle, style = style_iris)
walk_regions(wb, "header", openxlsx::addStyle, style = style_header, stack = TRUE)
walk_regions(wb, "colnames", openxlsx::addStyle, style = style_colnames, stack = TRUE)
walk_regions(wb, "body", openxlsx::addStyle, style = style_body, stack = TRUE)


# You can also use functions that have *either* the rows or cols argument,
# so the following works:
walk_regions(wb, "table", openxlsx::setColWidths, widths = 14)
walk_regions(wb, "colnames", openxlsx::setRowHeights, heights = 34)


