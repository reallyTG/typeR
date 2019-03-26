library(sdm)


### Name: sdmData
### Title: creating sdm Data object
### Aliases: sdmData sdmData,ANY,data.frame,ANY,missing-method
###   sdmData,data.frame,formula,ANY,missing-method
###   sdmData,data.frame,missing,ANY,missing-method
###   sdmData,ANY,data.frame,missing,missing-method
###   sdmData,ANY,SpatialPoints,ANY,missing-method
###   sdmData,ANY,SpatialPoints,ANY,Raster-method
### Keywords: spatial,species,data

### ** Examples

## Not run: 
##D # Example 1: a data.frame containing records for a species (sp) and two predictors (b15 & NDVI):
##D 
##D file <- system.file("external/pa_df.csv", package="sdm")
##D 
##D df <- read.csv(file)
##D 
##D head(df) 
##D 
##D d <- sdmData(sp~b15+NDVI,train=df)
##D 
##D d
##D 
##D # or simply:
##D d <- sdmData(sp~b15+NDVI,train=df)
##D 
##D d
##D 
##D #--------
##D # if formula is not specified, function tries to detect species and covariates, it works well only
##D # if dataset contains no additional columns but species and covariates!
##D 
##D d <- sdmData(train=df)
##D 
##D d
##D 
##D # # only right hand side of the formula is specified (one covariate), so function detects species:
##D d <- sdmData(~NDVI,train=df) 
##D 
##D d 
##D 
##D #----------
##D ###########
##D # Example 2: a data.frame containing presence-absence records for 1 species, 4 covariates, and 
##D # x, y coordinates:
##D 
##D file <- system.file("external/pa_df_with_xy.csv", package="sdm")
##D 
##D df <- read.csv(file)
##D 
##D head(df) 
##D 
##D d <- sdmData(sp~b15+NDVI+categoric1+categoric2+coords(x+y),train=df) 
##D 
##D d
##D #----
##D # categoric1 and categoric2 are categorical variables (factors), if not sure the data.frame has 
##D # them as factor, it can be specified in the formula:
##D d <- sdmData(sp~b15+NDVI+f(categoric1)+f(categoric2)+coords(x+y),train=df) 
##D 
##D d
##D # more simple forms of the formula:
##D d <- sdmData(sp~.+coords(x+y),train=df) 
##D 
##D d
##D 
##D d <- sdmData(~.+coords(x+y),train=df)  # function detects the species
##D 
##D d
##D ##############
##D # Example 3: a data.frame containing presence-absence records for 10 species:
##D 
##D file <- system.file("external/multi_pa_df.csv", package="sdm")
##D 
##D df <- read.csv(file)
##D 
##D head(df) 
##D 
##D # in the following formula, spatial coordinates columns are specified, and the rest is asked to
##D # be detected by the function:
##D d <- sdmData(~.+coords(x+y),train=df)  
##D 
##D d
##D 
##D #--- or it can be customized wich species and which covariates are needed:
##D d <- sdmData(sp1+sp2+sp3~b15+NDVI+f(categoric1) + coords(x+y),train=df) 
##D 
##D d # 3 species, 3 covariates, and coordinates
##D # just be careful that if you put "." in the right hand side, while not all species columns or 
##D # additional columns (e.g., coordinates, time) are specified in the formula, then it takes those
##D # columns as covariates which is NOT right!
##D 
##D #########
##D # Example 4: Spatial data:
##D 
##D file <- system.file("external/pa_spatial_points.shp", package="sdm") # path to a shapefile
##D 
##D # use a package like rgdal, or maptools, or shapefile function in package raster to read shapefile:
##D p <- shapefile(file)
##D class(p) # a "SpatialPointsDataFrame"
##D 
##D plot(p)
##D 
##D head(p) # it contains data for 3 species
##D 
##D # presence-absence plot for the first species (i.e., sp1)
##D plot(p[p@data$sp1 == 1,],col='blue',pch=16, main='Presence-Absence for sp1')
##D 
##D points(p[p@data$sp1 == 0,],col='red',pch=16)
##D 
##D 
##D # Let's read raster dataset containing predictor variables for this study area:
##D 
##D file <- system.file("external/predictors.grd", package="sdm") # path to a raster object
##D 
##D r <- brick(file)
##D 
##D r # a RasterBrick object including 2 rasters (covariates)
##D 
##D plot(r)
##D 
##D # now, we can use the species points and predictor rasters in sdmData function:
##D d <- sdmData(sp1+sp2+sp3~b15+NDVI,train=p,predictors = r)
##D 
##D d
##D 
##D ##################
##D # Example 5: presence-only records:
##D 
##D 
##D file <- system.file("external/po_spatial_points.shp", package="sdm") # path to a shapefile
##D 
##D # use an appropriate function to read the shapefile (e.g., readOGR in rgdal, readShapeSpatial in 
##D # maptools, or shapefile in raster):
##D 
##D po <- shapefile(file)
##D class(po) # a "SpatialPointsDataFrame"
##D 
##D 
##D head(po) # it contains data for one species (sp4) and the column has only presence records!
##D 
##D 
##D d <- sdmData(sp4~b15+NDVI,train=po,predictors = r)
##D 
##D d # as you see in the type, the data is Presence-Only
##D 
##D ### we can add another argument (i.e., bg) to generate background (pseudo-absence) records:
##D 
##D #------ in bg, we are going to provide a list containing the setting to generate background
##D #------ the setting includes n (number of background records), method (the method used for 
##D #------ background generation; gRandom refers to random in geographic space), and remove (whether 
##D #------ points located in presence sites should be removed).
##D 
##D d <- sdmData(sp4~b15+NDVI,train=po,predictors = r,bg=list(n=1000,method='gRandom',remove=TRUE))
##D 
##D d       # as you see in the type, the data is Presence-Background
##D 
##D # you can alternatively, put a data.frame including background records in bg!
## End(Not run)



