library(colt)


### Name: colt_theme
### Title: Create and set color themes
### Aliases: colt_theme set_theme

### ** Examples

mytheme <- colt_theme(
  clt_h1 = crayon::combine_styles(crayon::red, crayon::bold)
)

mytheme  # preview theme

cat(clt_h1("Important"))

set_theme(mytheme)
cat(clt_h1("Important"))

set_theme(clt_theme_light)
cat(clt_h1("Important"))




