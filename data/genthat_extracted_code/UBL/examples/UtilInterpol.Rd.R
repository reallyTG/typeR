library(UBL)


### Name: UtilInterpol
### Title: Utility surface obtained through methods for spatial
###   interpolation of points.
### Aliases: UtilInterpol
### Keywords: utility surface

### ** Examples

## Not run: 
##D # examples with a utility surface
##D data(Boston, package = "MASS")
##D 
##D tgt <- which(colnames(Boston) == "medv")
##D sp <- sample(1:nrow(Boston), as.integer(0.7*nrow(Boston)))
##D train <- Boston[sp,]
##D test <- Boston[-sp,]
##D 
##D control.parms <- phi.control(Boston[,tgt], method="extremes", extr.type="both")
##D # the boundaries of the domain considered
##D minds <- min(Boston[,tgt])-5
##D maxds <- max(Boston[,tgt])+5
##D 
##D # build m.pts to include at least the utility of the
##D # points (minds, maxds) and (maxds, minds)
##D m.pts <- matrix(c(minds, maxds, -1, maxds, minds, 0),
##D                 byrow=TRUE, ncol=3)
##D 
##D trues <- test[,tgt]
##D library(randomForest)
##D model <- randomForest(medv~., train)
##D preds <- predict(model, test)
##D 
##D resLIN <- UtilInterpol(trues, preds, type="util", control.parms, minds, maxds, m.pts,
##D                          method = "bilinear", visual=TRUE)
##D resIDW <- UtilInterpol(trues, preds, type="util", control.parms, minds, maxds, m.pts,
##D                         method = "idw", visual=TRUE)
##D resSPL <- UtilInterpol(trues, preds, type="util", control.parms, minds, maxds, m.pts,
##D                         method = "spl", visual=TRUE)
##D resKRIGE <- UtilInterpol(trues, preds, type="util", control.parms, minds, maxds, m.pts,
##D                           method = "krige", visual=TRUE)
##D 
##D # examples with a cost surface
##D data(Boston, package = "MASS")
##D 
##D tgt <- which(colnames(Boston) == "medv")
##D sp <- sample(1:nrow(Boston), as.integer(0.7*nrow(Boston)))
##D train <- Boston[sp,]
##D test <- Boston[-sp,]
##D 
##D # the boundaries of the domain considered
##D minds <- min(Boston[,tgt])-5
##D maxds <- max(Boston[,tgt])+5
##D 
##D # build m.pts to include at least the utility of the
##D # points (minds, maxds) and (maxds, minds)
##D m.pts <- matrix(c(minds, maxds, 5, maxds, minds, 20),
##D                 byrow=TRUE, ncol=3)
##D 
##D trues <- test[,tgt]
##D 
##D # train a model and predict on test set
##D library(randomForest)
##D model <- randomForest(medv~., train)
##D preds <- predict(model, test)
##D 
##D costLIN <- UtilInterpol(trues, preds, type="cost", control.parms=NULL, minds, maxds, m.pts,
##D                          method = "bilinear", visual=TRUE )
##D 
##D costSPL <- UtilInterpol(trues, preds, type="cost", control.parms=NULL, minds, maxds, m.pts,
##D                         method = "spl", visual=TRUE)
##D 
##D costKRIGE <- UtilInterpol(trues, preds, type="cost", control.parms=NULL, minds, maxds, m.pts,
##D                           method = "krige", visual=TRUE)
##D 
##D costIDW <- UtilInterpol(trues, preds, type="cost", control.parms=NULL, minds, maxds, m.pts,
##D                         method = "idw", visual=TRUE)
##D 
##D 
##D # if the user has a cost matrix and wants to specify the control.parms:
##D my.pts <- matrix(c(0, 0, 0, 10, 0, 0, 20, 0, 0, 45, 0, 0), byrow=TRUE, ncol=3)
##D control.parms <- phi.control(trues, method="range", control.pts = my.pts)
##D 
##D costLIN <- UtilInterpol(trues, preds, type="cost", control.parms=control.parms,
##D                         minds, maxds, m.pts, method = "bilinear", visual=TRUE )
##D 
##D 
##D # first trues and preds
##D trues[1:5]
##D preds[1:5]
##D trues[1:5]-preds[1:5]
##D 
##D # first cost results on these predictions for cost surface costIDW
##D costIDW[1:5]
##D # a summary of these prediction costs:
##D summary(costIDW)
##D 
##D #example with a benefit surface
##D 
##D # define control.parms either by defining a list with 3 named elements 
##D # or by calling phi.control function with method range and passing 
##D # the selected control.pts
##D control.parms <- list(method="range", npts=5,
##D                       control.pts=c(0,1,0,10,5,0.5,20,10,0.5,30,30,0,50,30,0))
##D m.pts <- matrix(c(minds, maxds, 0, maxds, minds, 0),
##D                 byrow=TRUE, ncol=3)
##D                 
##D benLIN <- UtilInterpol(trues, preds, type="ben", control.parms, minds, maxds, m.pts,
##D                        method = "bilinear", visual=TRUE)
##D benIDW <- UtilInterpol(trues, preds, type="ben", control.parms, minds, maxds, m.pts,
##D                        method = "idw", visual=TRUE)
##D benSPL <- UtilInterpol(trues, preds, type="ben", control.parms, minds, maxds, m.pts,
##D                        method = "spl", visual=TRUE)
##D benKRIGE <- UtilInterpol(trues, preds, type="ben", control.parms, minds, maxds, m.pts,
##D                          method = "krige", visual=TRUE)
## End(Not run)



