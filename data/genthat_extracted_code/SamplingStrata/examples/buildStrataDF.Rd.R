library(SamplingStrata)


### Name: buildStrataDF
### Title: Builds the "strata" dataframe containing information on target
###   variables Y's distributions in the different strata, starting from
###   sample data or from a frame
### Aliases: buildStrataDF
### Keywords: survey

### ** Examples

## Not run: 
##D # Plain example without model
##D data(swissframe)
##D strata <- buildStrataDF(dataset=swissframe,model=NULL)
##D head(strata)
##D 
##D # More complex example with models
##D library(SamplingStrata)
##D data(swissmunicipalities)
##D swiss <- swissmunicipalities[,c("HApoly","Surfacesbois","Airind","POPTOT")]
##D Y1 = swiss$Surfacesbois
##D X1 = swiss$HApoly
##D mod1 <- lm( Y1 ~ X1 )
##D summary(mod1)
##D mod1$coefficients[2]
##D summary(mod1)$sigma
##D 
##D Y2 = swiss$Airind
##D X2 = swiss$POPTOT
##D plot(log(X2[X2>0]),log(Y2[X2>0]))
##D mod2 <- lm( log(Y2[X2 > 0 & Y2>0]) ~ log(X2[X2 > 0 & Y2>0]) )
##D summary(mod2)
##D mod2$coefficients[2]
##D summary(mod2)$sigma
##D 
##D swiss$id <- c(1:nrow(swiss))
##D swiss$dom <- 1
##D frame <- buildFrameDF(swiss,id="id",X="id",Y=c("HApoly","POPTOT"),domainvalue="dom")
##D 
##D model <- NULL
##D model$type[1] <- "linear"
##D model$beta[1] <- mod1$coefficients[2]
##D model$sig2[1] <- summary(mod1)$sigma
##D model$gamma[1] = 2
##D model$type[2] <- "loglinear"
##D model$beta[2] <- mod2$coefficients[2]
##D model$sig2[2] <- summary(mod2)$sigma
##D model$gamma[2] = NA
##D model <- as.data.frame(model)
##D 
##D strata <- buildStrataDF(dataset=frame, model=model)
## End(Not run)



