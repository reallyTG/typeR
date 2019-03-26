library(SSN)


### Name: splitPredictions
### Title: Split Prediction Sets in a SpatialStreamNetwork Object
### Aliases: splitPredictions

### ** Examples

library(SSN)

# for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()

## Import the SpatialStreamNetwork object
mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn'),
  predpts = "pred1km")

# Split using the chunksof method
split1 <- splitPredictions(mf04, "pred1km", chunksof = 100)
summary(split1)

## Split using the by method
split2 <- splitPredictions(mf04, "pred1km", by = "netID")
summary(split2)

## Split using the subset method
split3 <- splitPredictions(mf04, "pred1km", subset = netID == 1,
     new.id="netID-1")
summary(split3)

## Split the predictions after creating a glmssn object
#mf04.glmssn <- glmssn(Summer_mn ~ ELEV_DEM + SLOPE, mf04,
#    CorModels = c("Exponential.tailup", "Exponential.taildown",
#    "Exponential.Euclid"),addfunccol = "afvArea")
#mf04.glmssn$ssn.object <- splitPredictions(mf04.glmssn$ssn.object, "pred1km",
#    subset = netID == 1, new.id="netID-1")
#pred.split<- predict(mf04.glmssn, "netID-1")
#plot(pred.split)




