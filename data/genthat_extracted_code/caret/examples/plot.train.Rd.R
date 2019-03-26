library(caret)


### Name: ggplot.train
### Title: Plot Method for the train Class
### Aliases: ggplot.train plot.train
### Keywords: hplot

### ** Examples



## Not run: 
##D library(klaR)
##D rdaFit <- train(Species ~ .,
##D                 data = iris, 
##D                 method = "rda", 
##D                 control = trainControl(method = "cv"))
##D plot(rdaFit)
##D plot(rdaFit, plotType = "level")
##D 
##D ggplot(rdaFit) + theme_bw()
##D 
## End(Not run)
 



