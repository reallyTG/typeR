library(xpose)


### Name: update_themes
### Title: Create xpose theme
### Aliases: update_themes

### ** Examples

# Before default theme
dv_vs_ipred(xpdb_ex_pk, facets = 'SEX')

# Updating the gg_theme and xp_theme
xpdb_ex_pk %>% 
  update_themes(gg_theme = theme_bw(),
                xp_theme = list(point_color = 'blue',
                                line_color  = 'blue')) %>% 
  dv_vs_ipred(facets = 'SEX')
  



