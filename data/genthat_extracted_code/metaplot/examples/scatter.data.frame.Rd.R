library(metaplot)


### Name: scatter.data.frame
### Title: Scatterplot Method for Data Frame
### Aliases: scatter.data.frame

### ** Examples

library(magrittr)
library(dplyr)
attr(Theoph$conc,'label') <- 'theophylline concentration'
attr(Theoph$conc,'guide') <- 'mg/L'
attr(Theoph$Time,'label') <- 'time'
attr(Theoph$Time,'guide') <- 'h'
attr(Theoph$Subject,'guide') <- '////'
# setOption(gg = T)
scatter(Theoph,conc, Time)
scatter(Theoph, conc, Time, Subject) # Subject as groups
scatter(Theoph, conc, Time, , Subject) # Subject as facet
scatter(Theoph, conc, Time, , Subject, gg = TRUE, scales = 'free_y' )
scatter(Theoph %>% filter(conc > 0), conc, Time, Subject, ylog = TRUE, yref = 5)
scatter(Theoph, conc, Time, Subject, ysmooth = TRUE)
scatter(Theoph, conc, Time, conf = TRUE, loc = 3, yref = 6)
scatter(Theoph, conc, Time, conf = TRUE, loc = 3, yref = 6, global = TRUE)
## Not run: 
##D \dontshow{
##D attr(Theoph,'title') <- 'Theophylline'
##D scatter(Theoph, conc, Time, main = function(x,...)attr(x,'title'))
##D scatter(Theoph, conc, Time, sub= function(x,...)attr(x,'title'))
##D setOption(main = function(x,...)attr(x,'title'))
##D scatter(Theoph, conc, Time)
##D }
## End(Not run)



