library(mirt)


### Name: itemplot
### Title: Displays item surface and information plots
### Aliases: itemplot
### Keywords: plot

### ** Examples

## Not run: 
##D 
##D data(LSAT7)
##D fulldata <- expand.table(LSAT7)
##D mod1 <- mirt(fulldata,1,SE=TRUE)
##D mod2 <- mirt(fulldata,1, itemtype = 'Rasch')
##D mod3 <- mirt(fulldata,2)
##D 
##D itemplot(mod1, 2)
##D itemplot(mod1, 2, CE = TRUE)
##D itemplot(mod1, 2, type = 'info')
##D itemplot(mod1, 2, type = 'info', CE = TRUE)
##D 
##D mods <- list(twoPL = mod1, onePL = mod2)
##D itemplot(mods, 1, type = 'RE')
##D 
##D #multidimensional
##D itemplot(mod3, 4, type = 'info')
##D itemplot(mod3, 4, type = 'infocontour')
##D itemplot(mod3, 4, type = 'tracecontour')
##D 
##D #polytomous items
##D pmod <- mirt(Science, 1, SE=TRUE)
##D itemplot(pmod, 3)
##D itemplot(pmod, 3, CE = TRUE)
##D itemplot(pmod, 3, type = 'score')
##D itemplot(pmod, 3, type = 'infotrace')
##D 
##D # use the directlabels package to put labels on tracelines
##D library(directlabels)
##D plt <- itemplot(pmod, 3)
##D direct.label(plt, 'top.points')
##D 
##D # change colour theme of plots
##D bwtheme <- standard.theme("pdf", color=FALSE)
##D plot(pmod, type='trace', par.settings=bwtheme)
##D itemplot(pmod, 1, type = 'trace', par.settings=bwtheme)
##D 
##D itemplot(pmod, 1, type = 'infoSE')
##D update(trellis.last.object(), par.settings = bwtheme)
##D 
##D # uncomment to run interactive shiny applet
##D # itemplot(shiny = TRUE)
##D     
## End(Not run)




