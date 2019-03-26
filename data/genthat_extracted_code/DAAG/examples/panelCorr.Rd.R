library(DAAG)


### Name: panelCorr
### Title: Scatterplot Panel
### Aliases: panelCorr
### Keywords: models

### ** Examples


# correlation between body and brain weights for 20 mice:

weights <- litters[,-1]
names(weights) <-  c("x","y")
weights <- list(weights)
weights[[1]]$xlim <- range(litters[,2])
weights[[1]]$ylim <- range(litters[,3])
panelplot(weights, panelCorr, totrows=1, totcols=1)



