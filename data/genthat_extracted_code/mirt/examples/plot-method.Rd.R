library(mirt)


### Name: plot-method
### Title: Plot various test-implied functions from models
### Aliases: plot-method plot,SingleGroupClass-method
###   plot,MultipleGroupClass-method plot,SingleGroupClass,missing-method
###   plot,DiscreteClass,missing-method plot,MixtureClass,missing-method

### ** Examples


## Not run: 
##D x <- mirt(Science, 1, SE=TRUE)
##D plot(x)
##D plot(x, type = 'info')
##D plot(x, type = 'infotrace')
##D plot(x, type = 'infotrace', facet_items = FALSE)
##D plot(x, type = 'infoSE')
##D plot(x, type = 'rxx')
##D 
##D # confidence interval plots when information matrix computed
##D plot(x)
##D plot(x, MI=100)
##D plot(x, type='info', MI=100)
##D plot(x, type='SE', MI=100)
##D plot(x, type='rxx', MI=100)
##D 
##D # use the directlabels package to put labels on tracelines
##D library(directlabels)
##D plt <- plot(x, type = 'trace')
##D direct.label(plt, 'top.points')
##D 
##D set.seed(1234)
##D group <- sample(c('g1','g2'), nrow(Science), TRUE)
##D x2 <- multipleGroup(Science, 1, group)
##D plot(x2)
##D plot(x2, type = 'trace')
##D plot(x2, type = 'trace', which.items = 1:2)
##D plot(x2, type = 'itemscore', which.items = 1:2)
##D plot(x2, type = 'trace', which.items = 1, facet_items = FALSE) #facet by group
##D plot(x2, type = 'info')
##D 
##D x3 <- mirt(Science, 2)
##D plot(x3, type = 'info')
##D plot(x3, type = 'SE', theta_lim = c(-3,3))
##D 
## End(Not run)



