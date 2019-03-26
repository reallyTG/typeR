library(tcpl)


### Name: tcplPlotM4ID
### Title: Plot fit summary plot by m4id
### Aliases: tcplPlotM4ID

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfExample()

tcplPlotM4ID(m4id = 18609966, lvl = 4) ## Create a level 4 plot
tcplPlotM4ID(m4id = 18609966, lvl = 5) ## Create a level 5 plot
tcplPlotM4ID(m4id = 18609966, lvl = 6) ## Create a level 6 plot

#' ## Reset configuration
options(conf_store)




