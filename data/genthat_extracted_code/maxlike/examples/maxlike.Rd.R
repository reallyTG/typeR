library(maxlike)


### Name: maxlike
### Title: Model occurrence probability using presence-only data
### Aliases: maxlike

### ** Examples


# Carolina Wren data used in Royle et. al (2012)
data(carw)

# Covert data.frame to a list of rasters
rl <- lapply(carw.data$raster.data, function(x) {
   m <- matrix(x, nrow=carw.data$dim[1], ncol=carw.data$dim[2], byrow=TRUE)
   r <- raster(m)
   extent(r) <- carw.data$ext
   r
})

# Create a raster stack and add layer names
rs <- stack(rl[[1]], rl[[2]], rl[[3]], rl[[4]], rl[[5]], rl[[6]])
names(rs) <- names(carw.data$raster.data)

plot(rs)


# Fit a model
fm <- maxlike(~pcMix + I(pcMix^2) + pcDec + I(pcDec^2)+ pcCon +
    I(pcCon^2) + pcGr + I(pcGr^2) +
    Lat + I(Lat^2) + Lon + I(Lon^2), rs, carw.data$xy1,
    method="BFGS", removeDuplicates=TRUE, savedata=TRUE)

summary(fm)
confint(fm)
AIC(fm)
logLik(fm)


# Produce species distribution map (ie, expected probability of occurrence)
psi.hat <- predict(fm) # Will warn if savedata=FALSE
plot(psi.hat)
points(carw.data$xy1, pch=16, cex=0.1)



# MAXENT sets "default prevalence" to an arbitrary value, 0.5.
# We could do something similar by fixing the intercept at logit(0.5)=0.
# However, it seems more appropriate to estimate this parameter.

fm.fix <- update(fm, fixed=c(0, rep(NA,length(coef(fm))-1)))

# Predict data.frame
presenceData <- as.data.frame(extract(rs, carw.data$xy1))
presenceData <- presenceData[complete.cases(presenceData), ]
presence.predictions <- predict(fm, newdata=presenceData)
summary(presence.predictions)

# Calibrate with data.frames
PresenceUniqueCells <- unique(cellFromXY(rs, xy=carw.data$xy1))
PresenceUnique <- xyFromCell(rs, PresenceUniqueCells)
presenceData <- as.data.frame(extract(rs, PresenceUnique))
library(dismo)
background <- randomPoints(rs, n=ncell(rs), extf=1.00)
backgroundData <- as.data.frame(extract(rs, y=background))
backgroundData <- backgroundData[complete.cases(backgroundData), ]
fm2 <- maxlike(~pcMix + I(pcMix^2) + pcDec + I(pcDec^2)+ pcCon +
    I(pcCon^2) + pcGr + I(pcGr^2) +
    Lat + I(Lat^2) + Lon + I(Lon^2), 
    rasters=NULL, points=NULL,
    x=presenceData, z=backgroundData,
    method="BFGS", removeDuplicates=TRUE, savedata=TRUE)

summary(fm2)

fm2$rasters <- rs
psi.hat2 <- predict(fm2)




## Not run: 
##D 
##D # Simulation example
##D 
##D set.seed(131)
##D x1 <- sort(rnorm(100))
##D x1 <- raster(outer(x1, x1), xmn=0, xmx=100, ymn=0, ymx=100)
##D 
##D x2 <- raster(matrix(runif(1e4), 100, 100), 0, 100, 0, 100)
##D 
##D # Code factors as dummy variables.
##D # Note, using asFactor(x3) will not help
##D x3 <- raster(matrix(c(0,1), 100, 100), 0, 100, 0, 100)
##D 
##D logit.psi <- -1 + 1*x1 + 0*x2
##D psi <- exp(logit.psi)/(1+exp(logit.psi))
##D plot(psi)
##D 
##D r <- stack(x1, x2, x3)
##D names(r) <- c("x1", "x2", "x3")
##D plot(r)
##D 
##D pa <- matrix(NA, 100, 100)
##D pa[] <- rbinom(1e4, 1, as.matrix(psi))
##D str(pa)
##D table(pa)
##D 
##D pa <- raster(pa, 0, 100, 0, 100)
##D plot(pa)
##D 
##D xy <- xyFromCell(pa, sample(Which(pa==1, cells=TRUE), 1000))
##D 
##D plot(x1)
##D points(xy)
##D 
##D fm2 <- maxlike(~x1 + x2 + x3, r, xy)
##D 
##D summary(fm2)
##D confint(fm2)
##D AIC(fm2)
##D logLik(fm2)
##D 
## End(Not run)




