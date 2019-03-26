## ----setup, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(fig.width = 8.83)

## ---- message = FALSE, warning=FALSE-------------------------------------
#install.packages("CAST")
library(CAST)

## ---- message = FALSE, warning=FALSE-------------------------------------
help(CAST)

## ---- message = FALSE, warning=FALSE-------------------------------------
data <- get(load(system.file("extdata","Cookfarm.RData",package="CAST")))
head(data)

## ---- message = FALSE, warning=FALSE-------------------------------------
library(mapview)
library(sp)
data_sp <- unique(data[,c("SOURCEID","Easting","Northing")])
coordinates(data_sp) <- ~Easting+Northing
proj4string(data_sp) <- CRS("+init=epsg:26911")
#plot the data:
mapviewOptions(basemaps = c("Esri.WorldImagery"))
mapview(data_sp)

## ---- message = FALSE, warning=FALSE-------------------------------------
library(lubridate)
library(ggplot2)
trainDat <- data[data$altitude==-0.3&
                   year(data$Date)==2012&
                   week(data$Date)%in%c(13:14),]
ggplot(data = trainDat, aes(x=Date, y=VW)) +
  geom_line(aes(colour=SOURCEID))

## ---- message = FALSE, warning=FALSE-------------------------------------
library(caret)
predictors <- c("DEM","BLD","TWI","Precip_cum","cday",
                "MaxT_wrcc","Precip_wrcc",
                "Northing","Easting","NDRE.M")
set.seed(10)
model <- train(trainDat[,predictors],trainDat$VW,
               method="rf",tuneLength=1,importance=TRUE,
               trControl=trainControl(method="cv",number=5))

## ---- message = FALSE, warning=FALSE-------------------------------------
library(raster)
predictors_sp <- stack(system.file("extdata","predictors_2012-03-25.grd",package="CAST"))
prediction <- predict(predictors_sp,model)
spplot(prediction)

## ---- message = FALSE, warning=FALSE-------------------------------------
model

## ---- message = FALSE, warning=FALSE-------------------------------------
set.seed(10)
indices <- CreateSpacetimeFolds(trainDat,spacevar = "SOURCEID",
                                k=5)
set.seed(10)
model_LLO <- train(trainDat[,predictors],trainDat$VW,
                   method="rf",tuneLength=1, importance=TRUE,
                   trControl=trainControl(method="cv",
                                          index = indices$index))
model_LLO

## ---- message = FALSE, warning=FALSE-------------------------------------
plot(varImp(model_LLO))

## ---- message = FALSE, warning=FALSE-------------------------------------
set.seed(10)
ffsmodel_LLO <- ffs(trainDat[,predictors],trainDat$VW,metric="Rsquared",
                    method="rf",tuneLength=1, verbose=FALSE,
                    trControl=trainControl(method="cv",
                                           index = indices$index))
ffsmodel_LLO
ffsmodel_LLO$selectedvars

## ---- message = FALSE, warning=FALSE-------------------------------------
plot_ffs(ffsmodel_LLO)

## ---- message = FALSE, warning=FALSE-------------------------------------
prediction_ffs <- predict(predictors_sp,ffsmodel_LLO)
spplot(prediction_ffs)

