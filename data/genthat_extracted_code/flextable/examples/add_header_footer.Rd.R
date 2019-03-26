library(flextable)


### Name: add_header_footer
### Title: Add a row of labels in header or footer part
### Aliases: add_header_footer add_header add_footer

### ** Examples

ft <- flextable( head( iris ),
  col_keys = c("Species", "Sepal.Length", "Petal.Length", "Sepal.Width", "Petal.Width") )
ft <- add_header(x = ft, Sepal.Length = "length",
  Sepal.Width = "width", Petal.Length = "length",
  Petal.Width = "width", Species = "Species", top = FALSE )
ft <- add_header(ft, Sepal.Length = "Inches",
  Sepal.Width = "Inches", Petal.Length = "Inches",
  Petal.Width = "Inches", Species = "Species", top = TRUE )
ft <- merge_h(ft, part = "header")
ft <- add_footer(ft, Species = "This is a footnote" )
ft <- merge_at(ft, j = 1:5, part = "footer")
ft



