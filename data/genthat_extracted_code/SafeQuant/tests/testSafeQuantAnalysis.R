
### INIT
if(!grepl("SafeQuant\\.Rcheck",getwd())){
	setwd(dirname(sys.frame(1)$ofile))
}
source("initTestSession.R")
### INIT END



### TEST FUNCTIONS

testExport <-function(){
	
	cat("--- testExport: --- \n")
	sqa <- safeQuantAnalysis(eset)
	export(sqa,file="~/tmp/tmp.csv")
	cat("--- testExport: PASS ALL TEST --- \n")
	
}

testSafequantAnalysis <- function(){
	
	cat("--- testSafequantAnalysis: --- \n")
	sqa <- safeQuantAnalysis(eset)
	stopifnot(sum(c("eset", "cv", "ratio", "pValue","qValue","baselineIntensity")  %in%  names(sqa)) == 6)
	stopifnot(nrow(sqa$pValue) == nrow(sqa$eset) )
	
	### filter our first 10 peptides
	esetFiltered <- eset
	fData(esetFiltered)$isFiltered[1:10] <- rep(T,10)
	sqaFiltered <- safeQuantAnalysis(esetFiltered)
	stopifnot(sum(is.na(sqaFiltered$pValue[,1])) == 10  )
	stopifnot(sum(!is.na(sqaFiltered$pValue[,1])) == (nrow(sqaFiltered$pValue)-10))
	
	# NA replace
	esetNaRep <- eset
	exprs(esetNaRep)[1,1] <- NA
	stopifnot(!is.na(exprs(safeQuantAnalysis(esetNaRep, method=c("naRep"))$eset)[1,1]))
	stopifnot(is.na(exprs(safeQuantAnalysis(esetNaRep, method=c(""))$eset)[1,1]))
		
	esetTmp <- parseProgenesisFeatureCsv(file=progenesisFeatureCsvFile1,expDesign=getExpDesignProgenesisCsv(progenesisFeatureCsvFile1))
	sqaGlobal <- safeQuantAnalysis(esetTmp, method="global")
	sqaRt <- safeQuantAnalysis(esetTmp, method="rt")
	stopifnot(sum(sqaRt$pValue < 0.01) < sum(sqaGlobal$pValue < 0.01))

	# TMT ratio correction
#	fit <- getRatioCorrectionFactorModel(rollUp(esetCalibMixPair))
#	sqaTMTCorrected <- safeQuantAnalysis(esetCalibMix, ratioCorrectionModel=fit, method=c(""))
#	rTmp <- getRatios(esetCalibMix)
#	stopifnot(all(abs(sqaTMTCorrected$ratio) >= abs(rTmp)))
#	stopifnot(round(sqaTMTCorrected$ratio[1,2],2) == round( rTmp[1,2]*coef(fit)[2] ,2))
#	stopifnot(round(sqaTMTCorrected$ratio[400,2],2) == round( rTmp[400,2]*coef(fit)[2] ,2))
#	stopifnot(all(safeQuantAnalysis(esetCalibMix, method=c(""))$pValue == sqaTMTCorrected$pValue))
#	
	# ratio filter multiple testing
	sqaRatioMT <- safeQuantAnalysis(eset,fcThrs =2^quantile(getRatios(eset)[,1])[2])
	stopifnot(sum(is.na(sqaRatioMT$qValue[,1])) > 400)
	
	cat("--- testSafequantAnalysis: PASS ALL TEST --- \n")
	
}


### TEST FUNCTIONS END

### TESTS

#testExport() 
testSafequantAnalysis()


#sqa <- safeQuantAnalysis(eset)
#print(sqa)




