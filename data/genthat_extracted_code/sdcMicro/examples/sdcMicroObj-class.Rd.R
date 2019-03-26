library(sdcMicro)


### Name: sdcMicroObj-class
### Title: Class '"sdcMicroObj"'
### Aliases: sdcMicroObj-class createSdcObj sdcMicroObj-class createSdcObj
###   undolast strataVar<- strataVar<-,sdcMicroObj,characterOrNULL-method
### Keywords: classes

### ** Examples


showClass("sdcMicroObj")
## Not run: 
##D data(testdata)
##D sdc <- createSdcObj(testdata,
##D   keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
##D   numVars=c('expend','income','savings'), w='sampling_weight')
##D head(sdc@manipNumVars)
##D ### Display Risks
##D sdc@risk$global
##D sdc <- dRisk(sdc)
##D sdc@risk$numeric
##D ### use addNoise without Parameters
##D sdc <- addNoise(sdc,variables=c("expend","income"))
##D head(sdc@manipNumVars)
##D sdc@risk$numeric
##D ### undolast
##D sdc <- undolast(sdc)
##D head(sdc@manipNumVars)
##D sdc@risk$numeric
##D ### redo addNoise with Parameter
##D sdc <- addNoise(sdc, noise=0.2)
##D head(sdc@manipNumVars)
##D sdc@risk$numeric
##D ### dataGen
##D #sdc <- undolast(sdc)
##D #head(sdc@risk$individual)
##D #sdc@risk$global
##D #sdc <- dataGen(sdc)
##D #head(sdc@risk$individual)
##D #sdc@risk$global
##D ### LocalSuppression
##D sdc <- undolast(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D sdc <- localSuppression(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D ### microaggregation
##D sdc <- undolast(sdc)
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc <- microaggregation(sdc)
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D ### pram
##D sdc <- undolast(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D sdc <- pram(sdc,keyVar="water")
##D head(sdc@risk$individual)
##D sdc@risk$global
##D ### rankSwap
##D sdc <- undolast(sdc)
##D head(sdc@risk$individual)
##D sdc@risk$global
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc <- rankSwap(sdc)
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D head(sdc@risk$individual)
##D sdc@risk$global
##D ### suda2
##D sdc <- suda2(sdc)
##D sdc@risk$suda2
##D ### topBotCoding
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc@risk$numeric
##D sdc <- topBotCoding(sdc, value=60000000, replacement=62000000, column="income")
##D head(get.sdcMicroObj(sdc, type="manipNumVars"))
##D sdc@risk$numeric
##D ### LocalRecProg
##D data(testdata2)
##D sdc <- createSdcObj(testdata2,
##D   keyVars=c("urbrur", "roof", "walls", "water", "sex", "relat"))
##D sdc@risk$global
##D sdc <- LocalRecProg(sdc)
##D sdc@risk$global
##D ### LLmodGlobalRisk
##D sdc <- undolast(sdc)
##D sdc <- LLmodGlobalRisk(sdc, inclProb=0.001)
##D sdc@risk$model
## End(Not run)

## we can also specify ghost (linked) variables
## these variables are linked to some categorical key variables
## and have the sampe suppression pattern as the variable that they
## are linked to after \code{localSuppression} has been applied
data(testdata)
testdata$electcon2 <- testdata$electcon
testdata$electcon3 <- testdata$electcon
testdata$water2 <- testdata$water

keyVars <- c("urbrur","roof","walls","water","electcon","relat","sex")
numVars <- c("expend","income","savings")
w <- "sampling_weight"

## we want to make sure that some variables not used as key-variables
## have the same suppression pattern as variables that have been
## selected as key variables. Thus, we are using 'ghost'-variables.
ghostVars <- list()

## we want variables 'electcon2' and 'electcon3' to be linked
## to key-variable 'electcon'
ghostVars[[1]] <- list()
ghostVars[[1]][[1]] <- "electcon"
ghostVars[[1]][[2]] <- c("electcon2","electcon3")

## we want variable 'water2' to be linked to key-variable 'water'
ghostVars[[2]] <- list()
ghostVars[[2]][[1]] <- "water"
ghostVars[[2]][[2]] <- "water2"

## create the sdcMicroObj
obj <- createSdcObj(testdata, keyVars=keyVars,
  numVars=numVars, w=w, ghostVars=ghostVars)

## apply 3-anonymity to selected key variables
obj <- kAnon(obj, k=3); obj

## check, if the suppression patterns are identical
manipGhostVars <- get.sdcMicroObj(obj, "manipGhostVars")
manipKeyVars <- get.sdcMicroObj(obj, "manipKeyVars")
all(is.na(manipKeyVars$electcon) == is.na(manipGhostVars$electcon2))
all(is.na(manipKeyVars$electcon) == is.na(manipGhostVars$electcon3))
all(is.na(manipKeyVars$water) == is.na(manipGhostVars$water2))

## exclude some variables
obj <- createSdcObj(testdata, keyVars=c("urbrur","roof","walls"), numVars="savings",
   weightVar=w, excludeVars=c("relat","electcon","hhcivil","ori_hid","expend"))
colnames(get.sdcMicroObj(obj, "origData"))



