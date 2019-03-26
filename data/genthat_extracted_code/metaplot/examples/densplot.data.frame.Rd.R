library(metaplot)


### Name: densplot.data.frame
### Title: Densplot Method for Data Frame
### Aliases: densplot.data.frame

### ** Examples

densplot(Theoph, conc, grid = TRUE )
densplot(Theoph, conc, grid = TRUE, gg = TRUE )
densplot(Theoph, conc, Subject )
densplot(Theoph, conc, , Subject )
densplot(Theoph, conc, , Subject, gg = TRUE, scales = 'free_y' )
attr(Theoph,'title') <- 'Theophylline'
densplot(Theoph, conc, main= function(x,...)attr(x,'title'))
densplot(Theoph, conc, sub= function(x,...)attr(x,'title'))



