library(SSN)


### Name: SimulateOnSSN
### Title: Simulating Data on Spatial Stream Networks
### Aliases: SimulateOnSSN

### ** Examples

#######################################
## example 1: Gaussian data, 2 networks
#######################################

library(SSN)
set.seed(101)
## simulate a SpatialStreamNetwork object
raw1.ssn <- createSSN(n = c(10,10),
    obsDesign = binomialDesign(c(50,50)), predDesign = binomialDesign(c(100,100)),
	importToR = TRUE, path = paste(tempdir(),"/sim1", sep = ""))
plot(raw1.ssn)

## create distance matrices, including between predicted and observed
createDistMat(raw1.ssn, "preds", o.write=TRUE, amongpred = TRUE)

## look at the column names of each of the data frames
names(raw1.ssn)

## extract the observed and predicted data frames
raw1DFobs <- getSSNdata.frame(raw1.ssn, "Obs")
raw1DFpred <- getSSNdata.frame(raw1.ssn, "preds")

## add a continuous covariate randomly
raw1DFobs[,"X1"] <- rnorm(length(raw1DFobs[,1]))
raw1DFpred[,"X1"] <- rnorm(length(raw1DFpred[,1]))

## add a categorical covariate randomly
raw1DFobs[,"F1"] <- as.factor(sample.int(3,length(raw1DFobs[,1]), replace = TRUE))
raw1DFpred[,"F1"] <- as.factor(sample.int(3,length(raw1DFpred[,1]), replace = TRUE))

## simulate Gaussian data
sim1.out <- SimulateOnSSN(raw1.ssn,
	ObsSimDF = raw1DFobs,
	PredSimDF = raw1DFpred,
	PredID = "preds",
	formula = ~ X1 + F1,
	coefficients = c(1, .5, -1, 1),
	CorModels = c("Exponential.tailup", "Exponential.taildown"),
	use.nugget = TRUE,
	use.anisotropy = FALSE,
	CorParms = c(2, 5, 2, 5, 0.1),
	addfunccol = "addfunccol")

## Columns of design matrix, coefficients argument applied to these
sim1.out$FixedEffects

## extract the ssn.object
sim1.ssn <- sim1.out$ssn.object

## extract the observed and predicted data frames, now with simulated values
sim1DFobs <- getSSNdata.frame(sim1.ssn, "Obs")
sim1DFobs[,"Sim_Values"]
sim1DFpred <- getSSNdata.frame(sim1.ssn, "preds")
sim1DFpred[,"Sim_Values"]

## plot the simulated observed values
plot(sim1.ssn, "Sim_Values")

## store simulated prediction values, and then create NAs in their place
sim1preds <- sim1DFpred[,"Sim_Values"]
sim1DFpred[,"Sim_Values"] <- NA
sim1.ssn <- putSSNdata.frame(sim1DFpred, sim1.ssn, "preds")

# NOT RUN, IT TAKES A MINUTE OR SO
## fit a model to see how well we estimate simulation parameters
#fitSimGau <- glmssn(Sim_Values ~ X1 + F1, ssn.object = sim1.ssn,
#	 CorModels = c("Exponential.tailup", "Exponential.taildown"),
#	 addfunccol = "addfunccol")
# LOAD A STORED VERSION INSTEAD
data(modelFits)
#make sure fitSimGau has the correct path, will vary for each users installation
#predictions depend on distance matrix created earlier with createDistMat function
#path of this lsn directory was created with createSSN
fitSimGau$ssn.object@path <- paste(tempdir(),"/sim1", sep = "")

summary(fitSimGau)

## make predictions
pred1.ssn <- predict(fitSimGau,"preds")
par(bg = "grey60")
plot(pred1.ssn, color.palette = terrain.colors(10))
par(bg = "white")

## compare predicted values to simulated values
pred1DF <- getSSNdata.frame(pred1.ssn, "preds")
plot(sim1preds, pred1DF[,"Sim_Values"], xlab = "True", ylab = "Predicted",
	pch = 19)

######################################
## example 2: Binomial data, 1 network
######################################
## NOT RUN takes about 10 seconds
#set.seed(102)
## simulate a SpatialStreamNetwork object
#raw2.ssn <- createSSN(n = 20,
#	obsDesign = binomialDesign(100), predDesign = binomialDesign(200),
#	importToR = TRUE, path = paste(tempdir(),"/sim2", sep = ""))
#plot(raw2.ssn)

## create distance matrices, including between predicted and observed
#createDistMat(raw2.ssn, "preds", o.write=TRUE, amongpred = TRUE)

## look at the column names of each of the data frames
#names(raw2.ssn)

## extract the observed and predicted data frames
#raw2DFobs <- getSSNdata.frame(raw2.ssn, "Obs")
#raw2DFpred <- getSSNdata.frame(raw2.ssn, "preds")

## add a continuous covariate randomly
#raw2DFobs[,"X1"] <- rnorm(length(raw2DFobs[,1]))
#raw2DFpred[,"X1"] <- rnorm(length(raw2DFpred[,1]))

## add a categorical covariate randomly
#raw2DFobs[,"F1"] <- as.factor(sample.int(3,length(raw2DFobs[,1]), replace = TRUE))
#raw2DFpred[,"F1"] <- as.factor(sample.int(3,length(raw2DFpred[,1]), replace = TRUE))

## simulate Binomial data
#sim2.out <- SimulateOnSSN(raw2.ssn,
#	ObsSimDF = raw2DFobs,
#	PredSimDF = raw2DFpred,
#	PredID = "preds",
#	formula = ~ X1 + F1,
#	coefficients = c(0, .5, -1, 1),
#	CorModels = c("Exponential.tailup", "Exponential.taildown",
#		"Exponential.Euclid"),
#	use.nugget = TRUE,
#	use.anisotropy = FALSE,
#	CorParms = c(.5, 5, .5, 5, .5, 2, 0.01),
#	addfunccol = "addfunccol",
#	family = "Binomial")

## Columns of design matrix, coefficients argument applied to these
#sim2.out$FixedEffects

## extract the ssn.object
#sim2.ssn <- sim2.out$ssn.object

## extract the observed and predicted data frames, now with simulated values
#sim2DFobs <- getSSNdata.frame(sim2.ssn, "Obs")
#sim2DFobs[,"Sim_Values"]
#sim2DFpred <- getSSNdata.frame(sim2.ssn, "preds")
#sim2DFpred[,"Sim_Values"]

## plot the simulated observed values
#plot(sim2.ssn, "Sim_Values", nclasses = 2, color.palette = c("blue","red"),
#	breaktype = "user", brks = cbind(c(-.5,.5),c(.5, 1.5)))

## store simulated prediction values, and then create NAs in their place
#sim2preds <- sim2DFpred[,"Sim_Values"]
#sim2DFpred[,"Sim_Values"] <- NA
#sim2.ssn <- putSSNdata.frame(sim2DFpred, sim2.ssn, "preds")

# NOT RUN, IT TAKES A MINUTE OR SO
## fit a model to see how well we estimate simulation parameters
#fitSimBin <- glmssn(Sim_Values ~ X1 + F1,
# 	ssn.object = sim2.ssn, EstMeth = "REML", family = "Binomial",
# 	CorModels = "Exponential.taildown",
# 	addfunccol = "addfunccol")
# LOAD A STORED VERSION INSTEAD
#data(modelFits)
#make sure fitSimBin has the correct path, will vary for each users installation
#predictions depend on distance matrix created earlier with createDistMat function
#path of this lsn directory was created with createSSN
#fitSimBin$ssn.object@path <- paste(tempdir(),"/sim2", sep = "")
#summary(fitSimBin)

## make predictions
#predSimBin <- predict(fitSimBin,"preds")
#par(bg = "grey60")
#plot(predSimBin, color.palette = terrain.colors(10))
#par(bg = "white")

## compare predicted values to simulated values
#pred2DF <- getSSNdata.frame(predSimBin, "preds")
#table(sim2preds, (pred2DF[,"Sim_Values"]>0)*1)

#####################################
## example 3: Poisson data, 1 network
#####################################
## NOT RUN Similar to Binomial Data
#set.seed(104)
## simulate a SpatialStreamNetwork object
#raw3.ssn <- createSSN(n = 20,
#	obsDesign = binomialDesign(100), predDesign = binomialDesign(200),
#	importToR = TRUE, path = paste(tempdir(),"/sim3", sep = ""))
#plot(raw3.ssn)

## create distance matrices, including between predicted and observed
#createDistMat(raw3.ssn, "preds", o.write=TRUE, amongpred = TRUE)

## look at the column names of each of the data frames
#names(raw3.ssn)

## extract the observed and predicted data frames
#raw3DFobs <- getSSNdata.frame(raw3.ssn, "Obs")
#raw3DFpred <- getSSNdata.frame(raw3.ssn, "preds")

## add a continuous covariate randomly
#raw3DFobs[,"X1"] <- rnorm(length(raw3DFobs[,1]))
#raw3DFpred[,"X1"] <- rnorm(length(raw3DFpred[,1]))
## add a categorical covariate randomly

#raw3DFobs[,"F1"] <- as.factor(sample.int(3,length(raw3DFobs[,1]), replace = TRUE))
#raw3DFpred[,"F1"] <- as.factor(sample.int(3,length(raw3DFpred[,1]), replace = TRUE))

## simulate Poisson data
#sim3.out <- SimulateOnSSN(raw3.ssn,
#	ObsSimDF = raw3DFobs,
#	PredSimDF = raw3DFpred,
#	PredID = "preds",
#	formula = ~ X1 + F1,
#	coefficients = c(1, .5, -1, 1),
#	CorModels = c("Exponential.taildown"),
#	use.nugget = TRUE,
#	use.anisotropy = FALSE,
#	CorParms = c(.5, 5, 0.01),
#	addfunccol = "addfunccol",
#	family = "Poisson")

## Columns of design matrix, coefficients argument applied to these
#sim3.out$FixedEffects

## extract the ssn.object
#sim3.ssn <- sim3.out$ssn.object

## extract the observed and predicted data frames, now with simulated values
#sim3DFobs <- getSSNdata.frame(sim3.ssn, "Obs")
#sim3DFobs[,"Sim_Values"]
#sim3DFpred <- getSSNdata.frame(sim3.ssn, "preds")
#sim3DFpred[,"Sim_Values"]

## plot the simulated observed values
#plot(sim3.ssn, "Sim_Values")

## store simulated prediction values, and then create NAs in their place
#sim3preds <- sim3DFpred[,"Sim_Values"]
#sim3DFpred[,"Sim_Values"] <- NA
#sim3.ssn <- putSSNdata.frame(sim3DFpred, sim3.ssn, "preds")

# NOT RUN, IT TAKES A MINUTE OR SO
## fit a model to see how well we estimate simulation parameters
#fitSimPoi <- glmssn(Sim_Values ~ X1 + F1,
# 	ssn.object = sim3.ssn, EstMeth = "REML", family = "Poisson",
# 	CorModels = "Exponential.taildown",
# 	addfunccol = "addfunccol")
# LOAD A STORED VERSION INSTEAD
#data(modelFits)
#make sure fitSimPoi has the correct path, will vary for each users installation
#predictions depend on distance matrix created earlier with createDistMat function
#path of this lsn directory was created with createSSN
#fitSimPoi$ssn.object@path <- paste(tempdir(),"/sim3", sep = "")
#summary(fitSimPoi)

## make predictions
#pred3.ssn <- predict(fitSimPoi,"preds")
#par(bg = "grey60")
#plot(pred3.ssn, color.palette = terrain.colors(10))
#par(bg = "white")

## compare predicted values to simulated values
#pred3DF <- getSSNdata.frame(pred3.ssn, "preds")

#plot(log(sim3preds+.1), pred3DF[,"Sim_Values"], xlab = "True", ylab = "Estimated",
#	pch = 19)




