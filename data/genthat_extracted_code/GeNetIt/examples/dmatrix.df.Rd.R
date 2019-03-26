library(GeNetIt)


### Name: dmatrix.df
### Title: Distance matrix to data.frame
### Aliases: dmatrix.df

### ** Examples

  library(sp)
  pts <- cbind( x=runif(15, 480933, 504250), y=runif(15, 4479433, 4535122))
    pts <- SpatialPointsDataFrame(pts, data.frame(ID=paste("ob",1:nrow(pts),sep="")))
  
  # Create distance matrix  
  dm <- spDists(pts, pts)  
    colnames(dm) <- pts@data[,"ID"] 
    rownames(dm) <- pts@data[,"ID"]
  
  # Coerce to data.frame with TO and FROM ID's and associated distance
  dm.df <- dmatrix.df(dm)
    head(dm.df)




