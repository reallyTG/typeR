library(officer)


### Name: sections
### Title: sections
### Aliases: sections body_end_section_continuous
###   body_end_section_landscape body_end_section_portrait
###   body_end_section_columns body_end_section_columns_landscape

### ** Examples

library(magrittr)

str1 <- "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " %>%
  rep(5) %>% paste(collapse = "")
str2 <- "Aenean venenatis varius elit et fermentum vivamus vehicula. " %>%
  rep(5) %>% paste(collapse = "")

my_doc <- read_docx()  %>%
  body_add_par(value = "Default section", style = "heading 1") %>%
  body_add_par(value = str1, style = "centered") %>%
  body_add_par(value = str2, style = "centered") %>%

  body_end_section_continuous() %>%
  body_add_par(value = "Landscape section", style = "heading 1") %>%
  body_add_par(value = str1, style = "centered") %>%
  body_add_par(value = str2, style = "centered") %>%
  body_end_section_landscape() %>%

  body_add_par(value = "Columns", style = "heading 1") %>%
  body_end_section_continuous() %>%
  body_add_par(value = str1, style = "centered") %>%
  body_add_par(value = str2, style = "centered") %>%
  slip_in_column_break() %>%
  body_add_par(value = str1, style = "centered") %>%
  body_end_section_columns(widths = c(2,2), sep = TRUE, space = 1) %>%

  body_add_par(value = str1, style = "Normal") %>%
  body_add_par(value = str2, style = "Normal") %>%
  slip_in_column_break() %>%
  body_end_section_columns_landscape(widths = c(3,3), sep = TRUE, space = 1)

print(my_doc, target = tempfile(fileext = ".docx"))



