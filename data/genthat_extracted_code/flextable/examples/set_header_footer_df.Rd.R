library(flextable)


### Name: set_header_footer_df
### Title: Set flextable's header or footer rows
### Aliases: set_header_footer_df set_header_df headers footers
###   set_footer_df

### ** Examples

typology <- data.frame(
  col_keys = c( "Sepal.Length", "Sepal.Width", "Petal.Length",
                "Petal.Width", "Species" ),
  what = c("Sepal", "Sepal", "Petal", "Petal", "Species"),
  measure = c("Length", "Width", "Length", "Width", "Species"),
  stringsAsFactors = FALSE )

ft <- flextable( head( iris ))
ft <- set_header_df(ft, mapping = typology, key = "col_keys" )
ft <- merge_h(ft, part = "header")
ft <- merge_v(ft, j = "Species", part = "header")
ft <- theme_vanilla(ft)


typology <- data.frame(
  col_keys = c( "Sepal.Length", "Sepal.Width", "Petal.Length",
                "Petal.Width", "Species" ),
  unit = c("(cm)", "(cm)", "(cm)", "(cm)", ""),
  stringsAsFactors = FALSE )
ft <- set_footer_df(ft, mapping = typology, key = "col_keys" )
ft <- italic(ft, italic = TRUE, part = "footer" )
ft <- theme_booktabs(ft)
ft



