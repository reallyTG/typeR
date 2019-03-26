library(RStoolbox)


### Name: fCover
### Title: Fractional Cover Analysis
### Aliases: fCover

### ** Examples

## No test: 
library(raster)
library(caret)
## Create fake input images
data(rlogo)
lsat <- rlogo
agg.level <- 9
modis <- aggregate(lsat, agg.level)

## Perform classification
lc      <- unsuperClass(lsat, nClass=2)

## Calculate the true cover, which is of course only possible in this example, 
## because the fake corse resolution imagery is exactly res(lsat)*9
trueCover <- aggregate(lc$map, agg.level, fun = function(x, ...){sum(x == 1, ...)/sum(!is.na(x))})

## Run with randomForest and support vector machine (radial basis kernel)
## Of course the SVM is handicapped in this example due to poor tuning (tuneLength)
par(mfrow=c(2,3))
for(model in c("rf", "svmRadial")){
   fc <- fCover(
           classImage = lc$map ,
           predImage = modis,
           classes=1,
           model=model,
           nSample = 50,
           number = 5,
           tuneLength=2
   )           
   
   ## How close is it to the truth?
   compare.rf <- trueCover - fc$map
   plot(fc$map, main = paste("Fractional Cover: Class 1\nModel:", model))
   plot(compare.rf, main = "Diffence\n true vs. predicted")
   plot(trueCover[],fc$map[],  xlim = c(0,1), ylim =c(0,1),
           xlab = "True Cover", ylab = "Predicted Cover" )
   abline(coef=c(0,1))
   rmse <- sqrt(cellStats(compare.rf^2, sum))/ncell(compare.rf)
   r2 <- cor(trueCover[], fc$map[], "complete.obs")
   text(0.9,0.1,paste0(paste(c("RMSE:","R2:"),
                           round(c(rmse, r2),3)),collapse="\n"), adj=1)
}

## Reset par
par(mfrow=c(1,1))
## End(No test)



