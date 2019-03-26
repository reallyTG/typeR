### R code from vignette source 'CARBayes.Rnw'

###################################################
### code chunk number 1: CARBayes.Rnw:71-72
###################################################
options(prompt = "R> ")


###################################################
### code chunk number 2: CARBayes.Rnw:407-413
###################################################
library(CARBayesdata)
library(shapefiles)
library(sp)
data(lipdata)
data(lipdbf)
data(lipshp)


###################################################
### code chunk number 3: CARBayes.Rnw:418-421
###################################################
library(CARBayes)
lipdbf$dbf <- lipdbf$dbf[ ,c(2,1)]
data.combined <- combine.data.shapefile(data=lipdata, shp=lipshp, dbf=lipdbf)


###################################################
### code chunk number 4: CARBayes.Rnw:435-439
###################################################
library(CARBayesdata)
library(sp)
data(GGHB.IG)
data(pricedata)


###################################################
### code chunk number 5: CARBayes.Rnw:444-445
###################################################
propertydata.spatial <- merge(x=GGHB.IG, y=pricedata, by="IG", all.x=FALSE)


###################################################
### code chunk number 6: CARBayes.Rnw:469-472
###################################################
library(rgdal)
propertydata.spatial <- spTransform(propertydata.spatial, 
                                    CRS("+proj=longlat +datum=WGS84 +no_defs"))


###################################################
### code chunk number 7: CARBayes.Rnw:477-487
###################################################
library(leaflet)
colours <- colorNumeric(palette = "BuPu", domain = propertydata.spatial@data$price)
map1 <- leaflet(data=propertydata.spatial) %>% 
    addTiles() %>% 
    addPolygons(fillColor = ~colours(price), color="red", weight=1, 
                fillOpacity = 0.7) %>%
    addLegend(pal = colours, values = propertydata.spatial@data$price, opacity = 1, 
                title="Price") %>%
    addScaleBar(position="bottomleft")
map1


###################################################
### code chunk number 8: CARBayes.Rnw:503-505
###################################################
propertydata.spatial@data$logprice <- log(propertydata.spatial@data$price)
propertydata.spatial@data$logdriveshop <- log(propertydata.spatial@data$driveshop)


###################################################
### code chunk number 9: CARBayes.Rnw:510-513
###################################################
library(splines)
form <- logprice~ns(crime,3)+rooms+sales+factor(type) + logdriveshop
model <- lm(formula=form, data=propertydata.spatial@data)


###################################################
### code chunk number 10: CARBayes.Rnw:520-525
###################################################
library(spdep)
W.nb <- poly2nb(propertydata.spatial, row.names = rownames(propertydata.spatial@data))
W.list <- nb2listw(W.nb, style="B")
resid.model <- residuals(model)
moran.mc(x=resid.model, listw=W.list, nsim=1000)


###################################################
### code chunk number 11: CARBayes.Rnw:664-668
###################################################
library(CARBayesdata)
library(sp)
data(GGHB.IG)
data(respiratorydata)


###################################################
### code chunk number 12: CARBayes.Rnw:673-674
###################################################
respiratorydata.spatial <- merge(x=GGHB.IG, y=respiratorydata, by="IG", all.x=FALSE)


###################################################
### code chunk number 13: CARBayes.Rnw:680-681
###################################################
head(respiratorydata.spatial@data)


###################################################
### code chunk number 14: CARBayes.Rnw:688-700
###################################################
respiratorydata.spatial <- spTransform(respiratorydata.spatial, 
                                    CRS("+proj=longlat +datum=WGS84 +no_defs"))
library(leaflet)
colours <- colorNumeric(palette = "BuPu", domain = respiratorydata.spatial@data$SMR)
map2 <- leaflet(data=respiratorydata.spatial) %>% 
    addTiles() %>% 
    addPolygons(fillColor = ~colours(SMR), color="red", weight=1, 
                fillOpacity = 0.7) %>%
    addLegend(pal = colours, values = respiratorydata.spatial@data$SMR, opacity = 1, 
                title="SMR") %>%
    addScaleBar(position="bottomleft")
map2


###################################################
### code chunk number 15: CARBayes.Rnw:715-718
###################################################
W.nb <- poly2nb(respiratorydata.spatial, row.names = 
                rownames(respiratorydata.spatial@data))
W <- nb2mat(W.nb, style="B")


###################################################
### code chunk number 16: CARBayes.Rnw:726-728
###################################################
income <- respiratorydata.spatial@data$incomedep
Z.incomedep <- as.matrix(dist(income, diag=TRUE, upper=TRUE)) 


