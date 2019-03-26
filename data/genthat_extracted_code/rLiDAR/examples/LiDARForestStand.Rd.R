library(rLiDAR)


### Name: LiDARForestStand
### Title: 3D stand visualization of LiDAR-derived individual trees
### Aliases: LiDARForestStand

### ** Examples


## Not run: 
##D #=======================================================================#
##D # EXAMPLE 01: Plotting single trees
##D #=======================================================================#
##D 
##D # cone crown shape
##D library(rgl)
##D open3d() 
##D LiDARForestStand(crownshape = "cone", CL = 10, CW =7, 
##D            HCB = 5, X =0, Y = 0, dbh = 0.4, crowncolor = "forestgreen", 
##D            stemcolor = "chocolate4", resolution="high", mesh=TRUE) 
##D                        
##D # ellipsoid crown shape 
##D open3d()
##D LiDARForestStand(crownshape = "ellipsoid", CL = 10, CW =7, 
##D            HCB = 5, X =0, Y = 0, dbh = 0.4, crowncolor = "forestgreen", 
##D            stemcolor = "chocolate4", resolution="high", mesh=TRUE) 
##D                        
##D # halfellipsoid crown shape 
##D open3d()
##D LiDARForestStand(crownshape = "halfellipsoid", CL = 10, CW =7, 
##D            HCB = 5, X =0, Y = 0, dbh = 0.4, crowncolor = "forestgreen", 
##D            stemcolor = "chocolate4", resolution="high", mesh=TRUE) 
##D                        
##D # paraboloid crown shape 
##D open3d()
##D LiDARForestStand(crownshape = "paraboloid", CL = 10, CW =7, 
##D            HCB = 5, X =0, Y = 0, dbh = 0.4, crowncolor = "forestgreen", 
##D            stemcolor = "chocolate4", resolution="high", mesh=TRUE)
##D 
##D # cylinder crown shape 
##D open3d()
##D LiDARForestStand(crownshape = "cylinder", CL = 10, CW =7, 
##D            HCB = 5, X =0, Y = 0, dbh = 0.4, crowncolor = "forestgreen", 
##D            stemcolor = "chocolate4", resolution="high", mesh=TRUE)
##D                        
##D # Set the shape=FALSE 
##D open3d()
##D LiDARForestStand(crownshape = "paraboloid", CL = 10, CW =7, 
##D            HCB = 5, X =0, Y = 0, dbh = 0.4, crowncolor = "forestgreen", 
##D            stemcolor = "chocolate4", resolution="high", mesh=FALSE)
##D 
##D #=======================================================================#
##D #EXAMPLE 02: Plotting a forest plantation stand in virtual 3-D space
##D #=======================================================================#
##D 
##D # Set the dimensions of the displayed forest stand
##D xlength<-30 # x length
##D ylength<-20 # y length
##D 
##D # Set the space between trees
##D sx<-3 # x space length
##D sy<-2 # y space length
##D 
##D # Tree location grid
##D XYgrid <- expand.grid(x = seq(1,xlength,sx), y = seq(1,ylength,sy))
##D 
##D # Get the number of trees
##D Ntrees<-nrow(XYgrid)
##D 
##D # Plot a virtual Eucalyptus forest plantation stand using the halfellipsoid tree crown shape
##D 
##D # Set stand trees parameters
##D meanHCB<-5  # mean of the height at canopy base
##D sdHCB<-0.1  # standard deviation of the height at canopy base
##D HCB<-rnorm(Ntrees, mean=meanHCB, sd=sdHCB) # height at canopy base
##D CL<-HCB     # tree crown height
##D CW<-HCB*0.6 # tree crown diameter
##D 
##D open3d()    # open a rgl window
##D 
##D # Plotting the stand
##D for( i in 1:Ntrees){
##D  LiDARForestStand(crownshape = "halfellipsoid", CL = CL[i], CW = CW[i], 
##D              HCB = HCB[i], X = XYgrid[i,1], Y = XYgrid[i,2], dbh = 0.4, 
##D              crowncolor = "forestgreen", stemcolor = "chocolate4", 
##D              resolution="high", mesh=TRUE) 
##D }
##D                            
##D # Add other plot parameters
##D axes3d(c("x-", "x-", "y-", "z"), col="gray")       # axes
##D title3d(xlab = "X Coord", ylab = " Y Coord", zlab = "Height", col="red") # title
##D planes3d(0, 0, -1, 0.001, col="gray", alpha=0.7)   # set a terrain plane
##D 
##D 
##D # Plotting a virtual single-species forest plantation stand using "cone" tree crown shape
##D 
##D # Set parameters f trees growing within the virtual stand
##D meanHCB<-3  # mean of the height at canopy base
##D sdHCB<-0.1  # standard deviation of the height at canopy base
##D HCB<-rnorm(Ntrees, mean=meanHCB, sd=sdHCB) # height at canopy base
##D CL<-HCB*2.0 # tree crown height
##D CW<-HCB*1.3 # tree crown diameter
##D 
##D open3d() # open a rgl window
##D # Plot stand
##D for( i in 1:Ntrees){
##D  LiDARForestStand(crownshape = "cone", CL = CL[i], CW = CW[i], 
##D              HCB = HCB[i], X = XYgrid[i,1], Y = XYgrid[i,2], dbh = 0.4, 
##D              crowncolor = "forestgreen", stemcolor = "chocolate4", 
##D              resolution="high", mesh=TRUE) 
##D }
##D                            
##D # Add other plot parameters
##D axes3d(c("x-", "x-", "y-", "z"), col="gray")       # axes
##D title3d(xlab = "X Coord", ylab = " Y Coord", zlab = "Height", col="red") # title
##D planes3d(0, 0, -1, 0.001, col="gray", alpha=0.7)   # set a terrain plane
##D 
##D #=======================================================================#
##D # EXAMPLE 03: Plotting a virtual mixed forest stand
##D #=======================================================================#
##D 
##D # 01. Plot different trees species in the stand with different crown shapes 
##D 
##D # Set the number of trees
##D Ntrees<-80 
##D 
##D # Set the trees locations
##D xcoord<-sample(1:100, Ntrees)  # x coord
##D ycoord<-sample(1:100, Ntrees)  # y coord
##D 
##D # Set a location grid of trees 
##D XYgrid<-cbind(xcoord,ycoord)
##D 
##D # Plot the location of the trees
##D plot(XYgrid, main="Tree location")
##D 
##D meanHCB<-7 # mean of the height at canopy base
##D sdHCB<-3   # standard deviation of height at canopy base
##D HCB<-rnorm(Ntrees, mean=meanHCB, sd=sdHCB) # height at canopy base
##D crownshape<-sample(c("cone", "ellipsoid","halfellipsoid", 
##D                   "paraboloid"), Ntrees, replace=TRUE) # tree crown shape 
##D CL<-HCB*1.3 # tree crown height
##D CW<-HCB     # tree crown diameter
##D 
##D open3d() # open a rgl window
##D # Plot stand
##D 
##D for( i in 1:Ntrees){
##D  LiDARForestStand(crownshape = crownshape[i], CL = CL[i], CW = CW[i], 
##D              HCB = HCB[i], X = as.numeric(XYgrid[i,1]), Y = as.numeric(XYgrid[i,2]), 
##D              dbh = 0.4, crowncolor = "forestgreen", stemcolor = "chocolate4", 
##D              resolution="high", mesh=TRUE)
##D }
##D                          
##D # Add other plot parameters
##D axes3d(c("x-", "x-", "y-", "z"), col="gray")       # axes
##D title3d(xlab = "X Coord", ylab = " Y Coord", zlab = "Height", col="red") # title
##D planes3d(0, 0, -1, 0.001, col="gray", alpha=0.7)   # set a terrain plane
##D 
##D 
##D # 02. Plot different tree height in the stand using different crown colors
##D 
##D # Set the number of trees
##D Ntrees<-80 
##D 
##D # Set the tree locations
##D xcoord<-sample(1:100, Ntrees) # x coord
##D ycoord<-sample(1:100, Ntrees) # y coord
##D 
##D # Set a location grid of trees 
##D XYgrid<-cbind(xcoord,ycoord)
##D 
##D # plot the location of the trees
##D plot(XYgrid, main="Tree location")
##D 
##D meanHCB<-7 # mean of the height at canopy base
##D sdHCB<-3   # standard deviation of the height at canopy base
##D HCB<-rnorm(Ntrees, mean=meanHCB, sd=sdHCB) # height at canopy base
##D crownshape<-sample(c("cone", "ellipsoid","halfellipsoid", "paraboloid"), 
##D                   Ntrees, replace=TRUE) # tree crown shape 
##D CL<-HCB*1.3 # tree crown height
##D CW<-HCB     # tree crown diameter
##D 
##D # Plot tree height based on the HCB quantiles
##D HCBq<-quantile(HCB) # HCB quantiles
##D crowncolor<-NA*(1:Ntrees) # set an empty crowncolor vector
##D 
##D # classify trees by HCB quantile
##D for (i in 1:Ntrees){
##D  if (HCB[i] <= HCBq[2]) {crowncolor[i]<-"red"}                        # group 1
##D  if (HCB[i] > HCBq[2] & HCB[i] <= HCBq[3] ) {crowncolor[i]<-"blue"}   # group 2
##D  if (HCB[i] > HCBq[3] & HCB[i] <= HCBq[4] ) {crowncolor[i]<-"yellow"} # group 3
##D  if (HCB[i] >= HCBq[4]) {crowncolor[i]<-"dark green"}                 # group 4
##D }
##D    
##D open3d() # open a rgl window
##D 
##D # Plot stand
##D for(i in 1:Ntrees){  
##D  LiDARForestStand(crownshape = crownshape[i], CL = CL[i], CW = CW[i], 
##D    HCB = HCB[i], X = as.numeric(XYgrid[i,1]), Y = as.numeric(XYgrid[i,2]), 
##D    dbh = 0.4, crowncolor = crowncolor[i],stemcolor = "chocolate4", 
##D    resolution="high", mesh=TRUE) 
##D }
##D    
##D # Add other plot parameters
##D axes3d(c("x-", "x-", "y-", "z"), col="gray")       # axes
##D title3d(xlab = "X Coord", ylab = " Y Coord", zlab = "Height", col="red") # title
##D planes3d(0, 0, -1, 0.001, col="gray", alpha=0.7)   # set a terrain plane
##D 
## End(Not run)



