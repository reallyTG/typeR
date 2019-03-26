# TODO: Add comment
# 
# Author: ahrnee-adm
###############################################################################

### INIT
if(!grepl("SafeQuant\\.Rcheck",getwd())){
	setwd(dirname(sys.frame(1)$ofile))
}
source("initTestSession.R")

### INIT END
### test functions

testGetImpuritiesMatrix <- function(){
	cat(" --- testGetImpuritiesMatrix --- \n")
	# 6-plex
	# old stopifnot(0.094 ==  getImpuritiesMatrix(6)[1,2])
	stopifnot(all.equal(0.004 , round(getImpuritiesMatrix(6)[1,2],3)))
	# 10-plex
	stopifnot(all.equal(0.004 , round(getImpuritiesMatrix(10)[1,2],3)))
	cat(" --- testGetImpuritiesMatrix: PASS ALL TEST --- \n")
	
	
	#getImpuritiesMatrix(test=T)
	# getImpuritiesMatrix(test=T)
	#       [,1]  [,2]  [,3]  [,4]  [,5]  [,6]
	# [1,] 0.939 0.061 0.000 0.000 0.000 0.000
	# [2,] 0.005 0.928 0.067 0.000 0.000 0.000
	# [3,] 0.000 0.011 0.947 0.042 0.000 0.000
	# [4,] 0.000 0.000 0.017 0.942 0.041 0.000
	# [5,] 0.000 0.000 0.000 0.016 0.963 0.021
	# [6,] 0.000 0.000 0.000 0.002 0.032 0.938
	# > cat("Synch1432219972384675000\n");

	
}

testPurityCorrectTMT <- function(){

	cat(" --- testPurityCorrectTMT --- \n")
	# 6-plex
	# old stopifnot( round(9.998839,4)  ==  round(purityCorrectTMT(tmtTestData6Plex,impurityMatrix=getImpuritiesMatrix(6))[1,1],4))
	stopifnot( all.equal(9.4965  , round(purityCorrectTMT(tmtTestData6Plex,impurityMatrix=getImpuritiesMatrix(6))[2,1],4)))
	
	# 10-plex
	stopifnot(all.equal(10.4493 ,  round(purityCorrectTMT(tmtTestData10Plex,impurityMatrix=getImpuritiesMatrix(10))[1,1],4)))
	cat(" --- testPurityCorrectTMT: PASS ALL TEST --- \n")
	
}

testCreateExpDesign <- function(){
	
	cat(" --- testCreateExpDesign --- \n")

	stopifnot(sum(createExpDesign("1,2,3:4,5,6",6)$isControl == c(T,T,T,F,F,F)) == 6 )
	stopifnot(sum(createExpDesign("10,2:3:4,5:6,7,8:9,1",10)$isControl == c(T,T,F,F,F,F,F,F,F,F)) == 10 )
	stopifnot(sum(createExpDesign("10,2:3:4,5:6,7,8:9,1",10)$condition[1:2] == c("Ctrl","Ctrl")) == 2 )
	stopifnot(length(unique(createExpDesign("10,2:3:4,5:6,7,8:9,1",10)$condition)) == 5 )
	
	#createExpDesign("1,4,10:2,5,8:3,6,9",10)
	cat(" --- testCreateExpDesign: PASS ALL TEST --- \n")
	
}

testGetCalibMixPairedEset <- function(){
	
	cat("--- testGetCalibMixPairedEset: --- \n")
	esetCalibMixPair <- .getCalibMixPairedEset(esetCalibMix)
	
	stopifnot(ncol(esetCalibMixPair)  == 2 )
	stopifnot(nrow(esetCalibMixPair)  == nrow(esetCalibMix)*5 )
	
	cat("--- testGetCalibMixPairedEset:  PASS ALL TEST  --- \n")
	
}

### compare our impurity correction to MSnbase
#comparePurityCorrectionToMsnbase <- function(){
#	
#	cat(" --- comparePurityCorrectionToMsnbase --- \n")
#	
#	library(MSnbase)
#	
#	impurities <- matrix(c(0.929, 0.059, 0.002, 0.000,
#					0.020, 0.923, 0.056, 0.001,
#					0.000, 0.030, 0.924, 0.045,
#					0.000, 0.001, 0.040, 0.923),
#			nrow = 4)
#	
#	qnt <- quantify(itraqdata[1:3,],reporters = iTRAQ4)
#	
#	exprs(qnt)[1,] <- rep(1,4)
#	exprs(qnt)[2,] <- 1:4
#	
#	exprs(qnt)[3,] <- rnorm(4,10)
#	
#	qnt.crct <- purityCorrect(qnt, impurities)
#	
#	testA <- solve(impurities,rep(1,4))
#	### our correction method
#	#testA <- as.vector(t(solve(impurities) %*% rep(1,4)))
#	#testB <- as.vector(t(solve(impurities) %*% 1:4))
#	testB <- solve(impurities,1:4)
#	#testC <- as.vector(t(solve(impurities) %*% exprs(qnt)[3,]))
#	testC <- solve(impurities,exprs(qnt)[3,])
#	
#	stopifnot( sum(round(testA,3) == round(exprs(qnt.crct)[1,],3)) == 4 )
#	stopifnot( sum(round(testB,3) == round(exprs(qnt.crct)[2,],3)) == 4 )
#	stopifnot( sum(round(testC,3) == round(exprs(qnt.crct)[3,],3)) == 4 )
#	
#	cat(" --- comparePurityCorrectionToMsnbase: PASS ALL TEST --- \n")
#	
#
#} 

testGetCalibMixEset <- function(){
	
	cat("--- testGetCalibMixEset:  --- \n")
	esetCalibMix <- .getCalibMixEset(esetCalibMix)
	stopifnot(nrow(esetCalibMix) == 437)
	cat("--- testGetCalibMixEset:  PASS ALL TEST  --- \n")
	
}

testGetCalibMixPairedEset <- function(){
	
	cat("--- testGetCalibMixPairedEset:  --- \n")
	esetCalibMixPair <- .getCalibMixPairedEset(.getCalibMixEset(esetCalibMix))
	
	stopifnot(nrow(esetCalibMixPair) == 2185)
	stopifnot(ncol(esetCalibMixPair) == 2)
	
	cat("--- testGetCalibMixPairedEset:  PASS ALL TEST  --- \n")
	
}

#testGetRatioCorrectionFactorModel <- function(){
#	
#	cat("--- testGetRatioCorrectionFactorModel:  --- \n")
#	fit <- getRatioCorrectionFactorModel(rollUp(esetCalibMixPair))
#	#stopifnot(round(coef(fit)[2],1) == 1.4)
#	cat("--- testGetRatioCorrectionFactorModel:  PASS ALL TEST  --- \n")
#	
#}

testIntensityAdjustment <- function(){
	
	cat("--- testIntensityAdjustment:  --- \n")
	
	if(F){
		load("/Users/ahrnee-adm/dev/R/workspace/SafeQuantTestData/rData/tmtRatioAdjTest.rData")
		
		intAdjObj <- .intensityAdjustment(eset, esetCalibMix)
		ratio <- getRatios(rollUp(sqNormalize(eset)))
		ratioAdj <- getRatios(rollUp(sqNormalize(intAdjObj$esetAdj)))
		
		lim <-c(-5,5)
		plot(ratio[,3], ratioAdj[,3], ylim=lim, xlim=lim )
		abline(coef=c(0,1),lty=2)
		
		cor(as.vector(unlist(ratio[,1])), as.vector(unlist(ratioAdj[,1])))^2
		
		lm( ratioAdj[,1] ~ ratio[,1])
		
		esetCalMixAdjPaired <- .getCalibMixPairedEset(intAdjObj$esetCalMixAdj)
		lim <-c(-4,4)
		.plotTMTRatioVsRefRatio(rollUp(esetCalibMixPair, featureDataColumnName="proteinName"), ylim=lim, xlim=lim)
		.plotTMTRatioVsRefRatio(rollUp(esetCalMixAdjPaired, featureDataColumnName="proteinName"), ylim=lim, xlim=lim)
	}
	
	
	expDesign <- data.frame(condition=paste("Condition",c(1,2,3,1,2,3,1,2,3,1),sep=""),isControl=c(T,F,F,T,F,F,T,F,F,T) )
	esetTMT10Plex <-  parseScaffoldRawFile(scaffoldTmt10PlexRawTestFile,expDesign = expDesign)
	intAdjObj2 <- .intensityAdjustment(esetTMT10Plex, esetCalibMix)
	stopifnot(round(intAdjObj2$globalNoiseFraction,3) == 0.193)
	
	#barplot(apply(exprs(esetTMT10Plex),2,sum,na.rm=T))
	
	cat("--- testIntensityAdjustment:  PASS ALL TEST  --- \n")
}


### test functions end

# INIT



### INIT END

### TESTS



if(F){
	testGetImpuritiesMatrix()
	testPurityCorrectTMT()
	testCreateExpDesign()
	testGetCalibMixEset()
	testGetCalibMixPairedEset()
	#testGetRatioCorrectionFactorModel()
	testIntensityAdjustment()
	
	
}


#comparePurityCorrectionToMsnbase()
### TESTS END






#CALIBMIXRATIOS


