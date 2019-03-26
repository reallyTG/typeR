library(geoBayes)


### Name: mkpredgrid2d
### Title: Make prediction grid
### Aliases: mkpredgrid2d

### ** Examples

## Not run: 
##D data(rhizoctonia)
##D predgrid <- mkpredgrid2d(rhizoctonia[c("Xcoord", "Ycoord")],
##D                          par.x = 100, chull = TRUE, exf = 1.2)
##D plot(predgrid$borders, type = "l")         # Domain for prediction
##D points(predgrid$grid, pch = 20, cex = .3)  # Prediction locations
##D points(rhizoctonia[c("Xcoord", "Ycoord")]) # Observed locations
## End(Not run)



