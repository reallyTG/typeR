library(DynTxRegime)


### Name: .newOptimalSeq
### Title: Value Search Method for Optimal Treatment Regime.
### Aliases: .newOptimalSeq
###   .newOptimalSeq,modelObj,NULL,NULL,Regime,NULL-method
###   .newOptimalSeq,modelObj,NULL,NULL,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,NULL,NULL,Regime,function-method
###   .newOptimalSeq,modelObj,modelObj,modelObj,Regime,NULL-method
###   .newOptimalSeq,modelObj,modelObj,NULL,Regime,NULL-method
###   .newOptimalSeq,modelObj,NULL,modelObj,Regime,NULL-method
###   .newOptimalSeq,modelObj,modelObj,modelObj,Regime,function-method
###   .newOptimalSeq,modelObj,modelObj,NULL,Regime,function-method
###   .newOptimalSeq,modelObj,NULL,modelObj,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,modelObj,modelObj,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,modelObj,NULL,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,NULL,modelObj,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,ModelObj_SubsetList,ModelObj_SubsetList,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,ModelObj_SubsetList,NULL,Regime,function-method
###   .newOptimalSeq,ModelObj_SubsetList,NULL,ModelObj_SubsetList,Regime,function-method
###   .newOptimalSeq,modelObj,ModelObj_SubsetList,ModelObj_SubsetList,Regime,function-method
###   .newOptimalSeq,modelObj,ModelObj_SubsetList,NULL,Regime,function-method
###   .newOptimalSeq,modelObj,NULL,ModelObj_SubsetList,Regime,function-method
###   .newOptimalSeq,ModelObj_DecisionPointList,NULL,NULL,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,NULL,NULL,Regime_DecisionPointList,NULL-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,NULL,NULL,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,ModelObj_DecisionPointList,ModelObj_DecisionPointList,Regime_DecisionPointList,NULL-method
###   .newOptimalSeq,ModelObj_DecisionPointList,ModelObj_DecisionPointList,NULL,Regime_DecisionPointList,NULL-method
###   .newOptimalSeq,ModelObj_DecisionPointList,NULL,ModelObj_DecisionPointList,Regime_DecisionPointList,NULL-method
###   .newOptimalSeq,ModelObj_DecisionPointList,ModelObj_DecisionPointList,ModelObj_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,ModelObj_DecisionPointList,NULL,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,NULL,ModelObj_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,ModelObj_DecisionPointList,ModelObj_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,ModelObj_DecisionPointList,NULL,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,NULL,ModelObj_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,ModelObj_SubsetList_DecisionPointList,ModelObj_SubsetList_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,ModelObj_SubsetList_DecisionPointList,NULL,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_SubsetList_DecisionPointList,NULL,ModelObj_SubsetList_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,ModelObj_SubsetList_DecisionPointList,ModelObj_SubsetList_DecisionPointList,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,ModelObj_SubsetList_DecisionPointList,NULL,Regime_DecisionPointList,list-method
###   .newOptimalSeq,ModelObj_DecisionPointList,NULL,ModelObj_SubsetList_DecisionPointList,Regime_DecisionPointList,list-method
### Keywords: internal

### ** Examples


data(bmiData)

y <- -(bmiData$month12BMI - bmiData$baselineBMI) / bmiData$baselineBMI * 100

bmiData$A2 <- as.factor(bmiData$A2)

moPropen <- buildModelObj(model = ~1, 
                          solver.method = 'glm',
                          solver.args = list("family" = "binomial"),
                          predict.args = list("type" = "response"))

moMain <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')
moCont <- buildModelObj(model = ~parentBMI+baselineBMI+month4BMI, 
                        solver.method = 'lm')

regime <- function(a,data){
            vec <- character(nrow(data))
            vec[data$month4BMI < a] <- "MR"
            vec[data$month4BMI >= a] <- "CD"
            return( vec )
          }

regime <- DynTxRegime:::.newRegime(object = regime)

regList <- list(Domains = matrix(c(20,40),ncol=2), 
                pop.size = 500, 
                starting.values = 30)

## Not run: 
##D obj <- DynTxRegime:::.newOptimalSeq(moPropen = moPropen,
##D                                     moMain = NULL, 
##D                                     moCont = NULL, 
##D                                     regime = regime,
##D                                     fSet = NULL,
##D                                     data = bmiData,
##D                                     response = y,
##D                                     txName = 'A2', 
##D                                     suppress = TRUE,
##D                                     argsList = regList)
##D 
##D is(obj)
##D 
##D coef(obj)
##D DTRstep(obj)
##D estimator(obj)
##D fitObject(obj)
##D optTx(obj)
##D optTx(obj,bmiData)
##D outcome(obj)
##D plot(obj)
##D propen(obj)
##D show(obj)
##D summary(obj)
## End(Not run)



