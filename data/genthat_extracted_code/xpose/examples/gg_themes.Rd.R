library(xpose)


### Name: gg_themes
### Title: An additional set of themes for ggplot2
### Aliases: gg_themes theme_bw2 theme_readable

### ** Examples

# With the gg_theme theme_readable() (default)
dv_vs_ipred(xpdb_ex_pk, facets = 'SEX')

# With the gg_theme theme_bw2()
xpdb_ex_pk %>% 
 update_themes(gg_theme = theme_bw2()) %>% 
 dv_vs_ipred(facets = 'SEX')
 



