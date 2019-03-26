library(biomod2)


### Name: sre
### Title: Surface Range Envelope
### Aliases: sre
### Keywords: models multivariate

### ** Examples


# species occurrences
DataSpecies <- read.csv(system.file("external/species/mammals_table.csv",
                                    package="biomod2"), row.names = 1)
head(DataSpecies)

# the name of studied species
myRespName <- 'GuloGulo'#'PteropusGiganteus'

# the presence/absences data for our species 
myResp <- as.numeric(DataSpecies[,myRespName])

# the XY coordinates of species data
myRespXY <- DataSpecies[which(myResp==1),c("X_WGS84","Y_WGS84")]

# Environmental variables extracted from BIOCLIM (bio_3, bio_4, bio_7, bio_11 & bio_12)
myExpl = stack( system.file( "external/bioclim/current/bio3.grd", 
                     package="biomod2"),
                system.file( "external/bioclim/current/bio4.grd", 
                             package="biomod2"), 
                system.file( "external/bioclim/current/bio7.grd", 
                             package="biomod2"),  
                system.file( "external/bioclim/current/bio11.grd", 
                             package="biomod2"), 
                system.file( "external/bioclim/current/bio12.grd", 
                             package="biomod2"))

# we build a raster layer based on environmental rasters for our response variable
myResp <- reclassify(subset(myExpl,1,drop=TRUE), c(-Inf,Inf,0))
myResp[cellFromXY(myResp,myRespXY)] <- 1


# Compute some SRE for several quantile values
g <- sre(Response = myResp, Explanatory = myExpl, NewData=myExpl, Quant=0)
gg <- sre(Response = myResp, Explanatory = myExpl, NewData=myExpl, Quant=0.025)
ggg <- sre(Response = myResp, Explanatory = myExpl, NewData=myExpl, Quant=0.05)

# visualise results
par(mfrow=c(2,2),mar=c(6, 5, 5, 3))
plot(myResp, main=paste(myRespName,"original distrib."))
plot(g, main="full data calibration")
plot(gg, main="Perc025")
plot(ggg, main="Perc05")





