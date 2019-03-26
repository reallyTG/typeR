library(geoGAM)


### Name: geoGAM
### Title: Select sparse geoadditive model
### Aliases: geoGAM
### Keywords: spatial models & regression & nonlinear

### ** Examples

### small examples with earthquake data

data(quakes)
set.seed(2)
quakes <- quakes[ sample(1:nrow(quakes), 50), ]

quakes.geogam <- geoGAM(response = "mag",
                        covariates = c("depth", "stations"),
                        data = quakes,
                        seed = 2,
                        max.stop = 5,
                        cores = 1)
summary(quakes.geogam)

## No test: 
data(quakes)

# create grouped factor with reduced number of levels
quakes$stations <- factor( cut( quakes$stations, breaks = c(0,15,19,23,30,39,132)) )

quakes.geogam <- geoGAM(response = "mag",
                        covariates = c("stations", "depth"),
                        coords = c("lat", "long"),
                        data = quakes,
                        max.stop = 10,
                        cores = 1)

summary(quakes.geogam)
summary(quakes.geogam, what = "path")
## End(No test)

## Not run: 
##D 
##D ## Use soil data set of soil mapping study area near Berne
##D 
##D data(berne)
##D set.seed(1)
##D 
##D # Split data sets and
##D # remove rows with missing values in response and covariates
##D 
##D d.cal <- berne[ berne$dataset == "calibration" & complete.cases(berne), ]
##D d.val <- berne[ berne$dataset == "validation" & complete.cases(berne), ]
##D 
##D 
##D ### Model selection for continuous response
##D ph10.geogam <- geoGAM(response = "ph.0.10",
##D                       covariates = names(d.cal)[14:ncol(d.cal)],
##D                       coords = c("x", "y"),
##D                       data = d.cal,
##D                       offset = T,
##D                       sets = mboost::cv(rep(1, nrow(d.cal)), type = "kfold"),
##D                       validation.data = d.val)
##D summary(ph10.geogam)
##D summary(ph10.geogam, what = "path")
##D 
##D 
##D ### Model selection for binary response
##D waterlog100.geogam <- geoGAM(response = "waterlog.100",
##D                              covariates = names(d.cal)[c(14:54, 56:ncol(d.cal))],
##D                              coords = c("x", "y"),
##D                              data = d.cal,
##D                              offset = F,
##D                              sets = sample( cut(seq(1,nrow(d.cal)),breaks=10,labels=FALSE) ),
##D                              validation.data = d.val)
##D summary(waterlog100.geogam)
##D summary(waterlog100.geogam, what = "path")
##D 
##D 
##D ### Model selection for ordered response
##D dclass.geogam <- geoGAM(response = "dclass",
##D                         covariates = names(d.cal)[14:ncol(d.cal)],
##D                         coords = c("x", "y"),
##D                         data = d.cal,
##D                         offset = T,
##D                         non.stationary = T,
##D                         seed = 1,
##D                         validation.data = d.val)
##D summary(dclass.geogam)
##D summary(dclass.geogam, what = "path")
##D 
## End(Not run)




