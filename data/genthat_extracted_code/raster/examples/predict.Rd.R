library(raster)


### Name: predict
### Title: Spatial model predictions
### Aliases: predict predict,Raster-method
### Keywords: methods spatial

### ** Examples

# A simple model to predict the location of the R in the R-logo using 20 presence points 
# and 50 (random) pseudo-absence points. This type of model is often used to predict
# species distributions. See the dismo package for more of that.

# create a RasterStack or RasterBrick with with a set of predictor layers
logo <- brick(system.file("external/rlogo.grd", package="raster"))
names(logo)

## Not run: 
##D # the predictor variables
##D par(mfrow=c(2,2))
##D plotRGB(logo, main='logo')
##D plot(logo, 1, col=rgb(cbind(0:255,0,0), maxColorValue=255))
##D plot(logo, 2, col=rgb(cbind(0,0:255,0), maxColorValue=255))
##D plot(logo, 3, col=rgb(cbind(0,0,0:255), maxColorValue=255))
##D par(mfrow=c(1,1))
## End(Not run)

# known presence and absence points
p <- matrix(c(48, 48, 48, 53, 50, 46, 54, 70, 84, 85, 74, 84, 95, 85, 
   66, 42, 26, 4, 19, 17, 7, 14, 26, 29, 39, 45, 51, 56, 46, 38, 31, 
   22, 34, 60, 70, 73, 63, 46, 43, 28), ncol=2)

a <- matrix(c(22, 33, 64, 85, 92, 94, 59, 27, 30, 64, 60, 33, 31, 9,
   99, 67, 15, 5, 4, 30, 8, 37, 42, 27, 19, 69, 60, 73, 3, 5, 21,
   37, 52, 70, 74, 9, 13, 4, 17, 47), ncol=2)

# extract values for points
xy <- rbind(cbind(1, p), cbind(0, a))
v <- data.frame(cbind(pa=xy[,1], extract(logo, xy[,2:3])))

#build a model, here an example with glm 
model <- glm(formula=pa~., data=v)

#predict to a raster
r1 <- predict(logo, model, progress='text')

plot(r1)
points(p, bg='blue', pch=21)
points(a, bg='red', pch=21)

# use a modified function to get a RasterBrick with p and se
# from the glm model. The values returned by 'predict' are in a list,
# and this list needs to be transformed to a matrix

predfun <- function(model, data) {
  v <- predict(model, data, se.fit=TRUE)
  cbind(p=as.vector(v$fit), se=as.vector(v$se.fit))
}

# predfun returns two variables, so use index=1:2
r2 <- predict(logo, model, fun=predfun, index=1:2)


## Not run: 
##D # You can use multiple cores to speed up the predict function
##D # by calling it via the clusterR function (you may need to install the snow package)
##D beginCluster()
##D r1c <- clusterR(logo, predict, args=list(model))
##D r2c <- clusterR(logo, predict, args=list(model=model, fun=predfun, index=1:2))
## End(Not run)

# principal components of a RasterBrick
# here using sampling to simulate an object too large
# too feed all its values to prcomp
sr <- sampleRandom(logo, 100)
pca <- prcomp(sr)

# note the use of the 'index' argument
x <- predict(logo, pca, index=1:3)
plot(x)

## Not run: 
##D # partial least square regression
##D library(pls)
##D model <- plsr(formula=pa~., data=v)
##D # this returns an array:
##D predict(model, v[1:5,])
##D # write a function to turn that into a matrix
##D pfun <- function(x, data) {
##D    y <- predict(x, data)
##D    d <- dim(y)
##D    dim(y) <- c(prod(d[1:2]), d[3])
##D    y
##D }
##D 
##D pp <- predict(logo, model, fun=pfun, index=1:3)
##D 
##D # Random Forest
##D 
##D library(randomForest)
##D rfmod <- randomForest(pa ~., data=v)
##D 
##D ## note the additional argument "type='response'" that is 
##D ## passed to predict.randomForest
##D r3 <- predict(logo, rfmod, type='response', progress='window')
##D 
##D ## get a RasterBrick with class membership probabilities
##D vv <- v
##D vv$pa <- as.factor(vv$pa)
##D rfmod2 <- randomForest(pa ~., data=vv)
##D r4 <- predict(logo, rfmod2, type='prob', index=1:2)
##D spplot(r4)
##D 
##D 
##D # cforest (other Random Forest implementation) example with factors argument
##D v$red <- as.factor(round(v$red/100))
##D logo$red <- round(logo[[1]]/100)
##D 
##D library(party)
##D m <- cforest(pa~., control=cforest_unbiased(mtry=3), data=v)
##D f <- list(levels(v$red))
##D names(f) <- 'red'
##D # the second argument in party:::predict.RandomForest
##D # is "OOB", and not "newdata" or similar. We need to write a wrapper
##D # predict function to deal with this 	
##D predfun <- function(m, d, ...) predict(m, newdata=d, ...)
##D 
##D pc <- predict(logo, m, OOB=TRUE, factors=f, fun=predfun)
##D 
##D # knn example, using calc instead of predict
##D library(class)
##D cl <- factor(c(rep(1, nrow(p)), rep(0, nrow(a))))
##D train <- extract(logo, rbind(p, a))
##D k <- calc(logo, function(x) as.integer(as.character(knn(train, x, cl))))
## End(Not run)



