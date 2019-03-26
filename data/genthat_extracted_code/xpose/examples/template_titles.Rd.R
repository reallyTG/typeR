library(xpose)


### Name: template_titles
### Title: Template titles
### Aliases: template_titles

### ** Examples

# Defined when creating a plot
dv_vs_ipred(xpdb_ex_pk, 
            title = '@x vs. @y',
            subtitle = '@ofv, @nind subjects, @nobs obs.',
            caption = '@run, @descr')
            
# Any label can be modified later on
dv_vs_ipred(xpdb_ex_pk, aes(point_color = SEX, 
                            line_color = SEX)) + 
 labs(title = 'This runs is: @descr', 
      color = 'Color scale for @run',
      x     = 'IPRED for @nind subjects',
      subtitle = NULL)




