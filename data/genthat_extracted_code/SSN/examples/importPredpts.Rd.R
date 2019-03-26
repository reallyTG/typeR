library(SSN)


### Name: importPredpts
### Title: Import Prediction Points into a SpatialStreamNetwork or glmssn
###   Object
### Aliases: importPredpts

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
#mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn', o.write = TRUE))
#use mf04 SpatialStreamNetwork object, already created
data(mf04)
#for examples only, make sure mf04p has the correct path
#if you use importSSN(), path will be correct
mf04 <- updatePath(mf04, paste0(tempdir(),'/MiddleFork04.ssn'))

mf04p <- mf04
# add existing prediction points on 1 km spacing
mf04p <- importPredpts(target = mf04p, predpts = "pred1km", obj.type = "ssn")
# get names and verify that pred1km has been added
names(mf04p)    
 
# add dense set of prediction points from Knapp stream
mf04p <- importPredpts(target = mf04p, predpts = "Knapp", obj.type = "ssn")
# get names and verify that Knapp has been added
names(mf04p)    

# add dense set of prediction points from CapeHorn stream
mf04p <- importPredpts(target = mf04p, predpts = "CapeHorn", obj.type = "ssn")
# get names and verify that CapeHorn has been added
names(mf04p)   
 
# create distance matrices, needed for prediction with stream network models
# NOT RUN
#createDistMat(mf04p, "pred1km", o.write = TRUE)
# for block prediction, we need distance among prediction points
#createDistMat(mf04p, "Knapp", o.write = TRUE, amongpreds = TRUE)
#createDistMat(mf04p, "CapeHorn", o.write = TRUE)

# Add prediction points to a glmssn object
# use models that have been created already
data(modelFits)
#for examples only, make sure fitSp has the correct path
#if you use importSSN(), path will be correct
fitSp$ssn.object <- updatePath(fitSp$ssn.object, 
	paste0(tempdir(),'/MiddleFork04.ssn'))

#use model named fitSp; NOT RUN; already imported
#fitSp <- importPredpts(target = fitSp, predpts = "pred1km", 
#  obj.type = "glm")
# now we can make predictions; make sure distance matrix for "pred1km" has
# been created
# NOT RUN
#fitSpPred <- predict(fitSp,"pred1km")
#plot(fitSpPred)
#fitSp <- importPredpts(target = fitSp, predpts = "Knapp", 
#  obj.type = "glm")
# NOT RUN
#fitSpPredKnapp <- predict(fitSp,"Knapp")
#plot(fitSpPredKnapp)




