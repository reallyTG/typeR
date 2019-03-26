library(xpose)


### Name: xp_themes
### Title: A set of xpose themes
### Aliases: xp_themes theme_xp_default theme_xp_xpose4

### ** Examples

# With the xp_theme theme_xp_default() (default)
dv_vs_ipred(xpdb_ex_pk, facets = 'SEX')

# With the xp_theme theme_xp_xpose4()
xpdb_ex_pk %>%
  update_themes(xp_theme = theme_xp_xpose4()) %>%
  dv_vs_ipred(facets = 'SEX')
  



