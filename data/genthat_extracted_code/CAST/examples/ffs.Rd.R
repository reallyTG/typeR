library(CAST)


### Name: ffs
### Title: Forward feature selection
### Aliases: ffs

### ** Examples

## Not run: 
##D data(iris)
##D ffsmodel <- ffs(iris[,1:4],iris$Species)
##D ffsmodel$selectedvars
##D ffsmodel$selectedvars_perf
## End(Not run)

# or perform model with target-oriented validation (LLO CV)
#the example is taken from the GSIF package and is described
#in Gasch et al. (2015). The ffs approach for this dataset is described in
#Meyer et al. (2018). Due to high computation time needed, only a small and thus not robust example
#is shown here.

## Not run: 
##D #run the model on three cores:
##D library(doParallel)
##D cl <- makeCluster(3)
##D registerDoParallel(cl)
##D 
##D #load and prepare dataset:
##D dat <- get(load(system.file("extdata","Cookfarm.RData",package="CAST")))
##D trainDat <- dat[dat$altitude==-0.3&year(dat$Date)==2012&week(dat$Date)%in%c(13:14),]
##D 
##D #visualize dataset:
##D ggplot(data = trainDat, aes(x=Date, y=VW)) + geom_line(aes(colour=SOURCEID))
##D 
##D #create folds for Leave Location Out Cross Validation:
##D set.seed(10)
##D indices <- CreateSpacetimeFolds(trainDat,spacevar = "SOURCEID",k=3)
##D ctrl <- trainControl(method="cv",index = indices$index)
##D 
##D #define potential predictors:
##D predictors <- c("DEM","TWI","BLD","Precip_cum","cday","MaxT_wrcc",
##D "Precip_wrcc","NDRE.M","Bt","MinT_wrcc","Northing","Easting")
##D 
##D #run ffs model with Leave Location out CV
##D set.seed(10)
##D ffsmodel <- ffs(trainDat[,predictors],trainDat$VW,method="rf",
##D tuneLength=1,trControl=ctrl)
##D ffsmodel
##D 
##D #compare to model without ffs:
##D model <- ffs(trainDat[,predictors],trainDat$VW,method="rf",
##D tuneLength=1, trControl=ctrl)
##D model
##D stopCluster(cl)
## End(Not run)



