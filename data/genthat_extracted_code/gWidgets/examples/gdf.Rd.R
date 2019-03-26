library(gWidgets)


### Name: gdf
### Title: Constructor of widget to edit a data frame
### Aliases: gdf gdfnotebook
### Keywords: interface

### ** Examples

## Not run: 
##D 	obj <- gdf(mtcars, container=gwindow("mtcars"), do.subset=TRUE)
##D 	obj[1,1]
##D 	obj[1,]
##D 	obj[,1]
##D         obj[1,1] <- 21
##D         obj[,] <- head(mtcars) ## replace df
## End(Not run)



