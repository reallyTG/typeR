library(ggthemes)


### Name: excel_new_pal
### Title: Excel (current versions) color palettes (discrete)
### Aliases: excel_new_pal

### ** Examples

library("scales")

for (i in names(ggthemes::ggthemes_data$excel$palettes)) {
  show_col(excel_new_pal(theme = i))(6)
}



