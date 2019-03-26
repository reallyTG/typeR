library(FRESA.CAD)


### Name: FRESA.CAD-package
### Title: FeatuRE Selection Algorithms for Computer-Aided Diagnosis
###   (FRESA.CAD)
### Aliases: FRESA.CAD-package FRESA.CAD
### Keywords: package

### ** Examples

    ## Not run: 
##D     ### Fresa Package Examples ####
##D     library("epiR")
##D     library("FRESA.CAD")
##D     library(network)
##D     library(GGally)
##D     library("e1071")
##D 
##D 
##D     # Start the graphics device driver to save all plots in a pdf format
##D     pdf(file = "Fresa.Package.Example.pdf",width = 8, height = 6)
##D 
##D 
##D     # Get the stage C prostate cancer data from the rpart package
##D 
##D     data(stagec,package = "rpart")
##D     options(na.action = 'na.pass')
##D     dataCancer <- cbind(pgstat = stagec$pgstat,
##D                         pgtime = stagec$pgtime,
##D                         as.data.frame(model.matrix(Surv(pgtime,pgstat) ~ .,stagec))[-1])
##D 
##D     #Impute missing values
##D     dataCancerImputed <- nearestNeighborImpute(dataCancer)
##D 
##D     # Remove the incomplete cases
##D     dataCancer <- dataCancer[complete.cases(dataCancer),]
##D 
##D 
##D     # Load a pre-stablished data frame with the names and descriptions of all variables
##D     data(cancerVarNames)
##D     # the Heat Map
##D     hm <- heatMaps(cancerVarNames,varRank=NULL,Outcome="pgstat",
##D                    data=dataCancer,title="Heat Map",hCluster=FALSE
##D                    ,prediction=NULL,Scale=TRUE,
##D                    theFiveColors=c("blue","cyan","black","yellow","red"),
##D                    outcomeColors = 
##D                      c("blue","lightgreen","yellow","orangered","red"),
##D                    transpose=FALSE,cexRow=0.50,cexCol=0.80,srtCol=35)
##D 
##D     # The univariate analysis
##D     UniRankFeaturesRaw <- univariateRankVariables(variableList = cancerVarNames,
##D                                                   formula = "pgstat ~ 1+pgtime",
##D                                                   Outcome = "pgstat",
##D                                                   data = dataCancer, 
##D                                                   categorizationType = "Raw", 
##D                                                   type = "LOGIT", 
##D                                                   rankingTest = "zIDI",
##D                                                   description = "Description",
##D                                                   uniType="Binary")
##D 
##D     print(UniRankFeaturesRaw)
##D 
##D     # A simple BSIWMS Model
##D 
##D     BSWiMSModel <- BSWiMS.model(formula = Surv(pgtime, pgstat) ~ 1, dataCancerImputed)
##D 
##D     # The Log-Rank Analysis using survdiff
##D 
##D     lrsurvdiff <- survdiff(Surv(pgtime,pgstat)~
##D                   BSWiMSModel$BSWiMS.model$back.model$linear.predictors > 0,
##D                   data=dataCancerImputed)
##D 
##D     # The Log-Rank Analysis EmpiricalSurvDiff and permutations of the null Chi distribution
##D     lrp <- EmpiricalSurvDiff(dataCancerImputed$pgtime,dataCancerImputed$pgstat,
##D                              BSWiMSModel$BSWiMS.model$back.model$linear.predictors > 0,
##D                              type="Chi",plots=TRUE,samples=10000)
##D 
##D     # The Log-Rank Analysis EmpiricalSurvDiff and permutations of the null SLR distribution
##D     lrp <- EmpiricalSurvDiff(dataCancerImputed$pgtime,dataCancerImputed$pgstat,
##D                              BSWiMSModel$BSWiMS.model$back.model$linear.predictors > 0,
##D                              type="SLR",plots=TRUE,samples=10000)
##D 
##D     # The Log-Rank Analysis EmpiricalSurvDiff and bootstrapping the SLR distribution
##D     lrp <- EmpiricalSurvDiff(dataCancerImputed$pgtime,dataCancerImputed$pgstat,
##D                              BSWiMSModel$BSWiMS.model$back.model$linear.predictors > 0,
##D                              computeDist=TRUE,plots=TRUE)
##D 
##D     #The performance of the final model using the summary function
##D     sm <- summary(BSWiMSModel$BSWiMS.model$back.model)
##D     print(sm$coefficients)
##D     pv <- plot(sm$bootstrap)
##D 
##D     # The equivalent model
##D     eq <- reportEquivalentVariables(BSWiMSModel$BSWiMS.model$back.model,data=dataCancer,
##D                                     variableList=cancerVarNames,Outcome = "pgstat",
##D                                     timeOutcome="pgtime",
##D                                     type = "COX");
##D 
##D     print(eq$equivalentMatrix)
##D 
##D     #The list of all models of the bootstrap forward selection 
##D     print(BSWiMSModel$forward.selection.list)
##D 
##D     #With FRESA.CAD we can do a leave-one-out using the list of models
##D     pm <- ensemblePredict(BSWiMSModel$forward.selection.list,
##D                           dataCancer,predictType = "linear",type="LOGIT",Outcome="pgstat")
##D 
##D     #Ploting the ROC with 95##D 
##D     pm <- plotModels.ROC(cbind(dataCancer$pgstat,
##D                                pm$ensemblePredict),main=("LOO Forward Selection Median Predict"))
##D 
##D     #The plotModels.ROC provides the diagnosis confusion matrix.
##D     summary(epi.tests(pm$predictionTable))
##D 
##D 
##D 
##D     #FRESA.CAD can be used to create a bagged model using the forward selection formulas
##D     bagging <- baggedModel(BSWiMSModel$forward.selection.list,dataCancer,useFreq=32)
##D     pm <- predict(bagging$bagged.model)
##D     pm <- plotModels.ROC(cbind(dataCancer$pgstat,pm),main=("Bagged"))
##D 
##D     #Let's check the performance of the model 
##D     sm <- summary(bagging$bagged.model)
##D     print(sm$coefficients)
##D 
##D     #Using bootstrapping object I can check the Jaccard Index
##D     print(bagging$Jaccard.SM)
##D 
##D     #Ploting the evolution of the coefficient value
##D     plot(bagging$coefEvolution$grade,main="Evolution of grade")
##D 
##D 
##D     gplots::heatmap.2(bagging$formulaNetwork,trace="none",
##D                       mar=c(10,10),main="eB:SWIMS Formula Network")
##D     barplot(bagging$frequencyTable,las = 2,cex.axis=1.0,
##D             cex.names=0.75,main="Feature Frequency")
##D     n <- network::network(bagging$formulaNetwork, directed = FALSE,
##D                           ignore.eval = FALSE,names.eval = "weights")
##D     ggnet2(n, label = TRUE, size = "degree",size.cut = 3,size.min = 1, 
##D            mode = "circle",edge.label = "weights",edge.label.size=4)
##D 
##D 
##D     # Get a Cox proportional hazards model using:
##D     # - The default parameters
##D 
##D     mdCOXs <- FRESA.Model(formula = Surv(pgtime, pgstat) ~ 1,data = dataCancer)
##D     sm <- summary(mdCOXs$BSWiMS.model)
##D     print(sm$coefficients)
##D 
##D     # The model with singificant improvement in the residual error
##D     mdCOXs <- FRESA.Model(formula = Surv(pgtime, pgstat) ~ 1,
##D                           data = dataCancer,OptType = "Residual" )
##D     sm <- summary(mdCOXs$BSWiMS.model)
##D     print(sm$coefficients)
##D 
##D     # Get a Cox proportional hazards model using second order models:
##D     mdCOX <- FRESA.Model(formula = Surv(pgtime, pgstat) ~ 1,
##D                          data = dataCancer,categorizationType="RawRaw")
##D     sm <- summary(mdCOX$BSWiMS.model)
##D     print(sm$coefficients)
##D 
##D     namesc <- names(mdCOX$BSWiMS.model$coefficients)[-1]
##D     hm <- heatMaps(mdCOX$univariateAnalysis[namesc,],varRank=NULL,
##D                    Outcome="pgstat",data=dataCancer,
##D                    title="Heat Map",hCluster=FALSE,prediction=NULL,Scale=TRUE,
##D                    theFiveColors=c("blue","cyan","black","yellow","red"),
##D                    outcomeColors = c("blue","lightgreen","yellow","orangered","red"),
##D                    transpose=FALSE,cexRow=0.50,cexCol=0.80,srtCol=35)
##D 
##D     # The LOO estimation
##D     pm <- ensemblePredict(mdCOX$BSWiMS.models$formula.list,dataCancer,
##D                           predictType = "linear",type="LOGIT",Outcome="pgstat")
##D     pm <- plotModels.ROC(cbind(dataCancer$pgstat,pm$ensemblePredict),main=("LOO Median Predict"))
##D     #Let us check the diagnosis performance
##D     summary(epi.tests(pm$predictionTable))
##D 
##D     # Get a Logistic model using FRESA.Model
##D     # - The default parameters
##D     dataCancer2 <-dataCancer 
##D     dataCancer2$pgtime <-NULL
##D     mdLOGIT <- FRESA.Model(formula = pgstat ~ 1,data = dataCancer2)
##D     if (!is.null(mdLOGIT$bootstrappedModel)) pv <- plot(mdLOGIT$bootstrappedModel)
##D     sm <- summary(mdLOGIT$BSWiMS.model)
##D     print(sm$coefficients)
##D 
##D 
##D     ## FRESA.Model with Cross Validation and Recursive Partitioning and Regression Trees
##D 
##D 
##D     md <- FRESA.Model(formula = Surv(pgtime, pgstat) ~ 1,data = dataCancer,
##D                       CVfolds = 10,repeats = 5,equivalent = TRUE,usrFitFun=rpart::rpart)
##D 
##D     colnames(md$cvObject$Models.testPrediction)
##D 
##D     pm <- plotModels.ROC(md$cvObject$LASSO.testPredictions,theCVfolds=10,main="CV LASSO",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$KNN.testPrediction,theCVfolds=10,main="KNN",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="Prediction",main="B:SWiMS Bagging",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="Ensemble.B.SWiMS"
##D                          ,main="Forward Selection Median Ensemble",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="Ensemble.Forward",main="Forward Selection Bagging",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="eB.SWiMS",main="Equivalent Model",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="Forward.Selection.Bagged",main="The Forward Bagging",cex=0.90)
##D 
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=20,
##D                          predictor="usrFitFunction",
##D                          main="Recursive Partitioning and Regression Trees",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=20,
##D                          predictor="usrFitFunction_Sel",
##D                          main="Recursive Partitioning and Regression Trees with FS",cex=0.90)
##D 
##D 
##D     ## FRESA.Model with Cross Validation, LOGISTIC and Support Vector Machine
##D 
##D 
##D     md <- FRESA.Model(formula = pgstat ~ 1,data = dataCancer2,
##D                       CVfolds = 10,repeats = 5,equivalent = TRUE,usrFitFun=svm)
##D 
##D     pm <- plotModels.ROC(md$cvObject$LASSO.testPredictions,theCVfolds=10,main="CV LASSO",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$KNN.testPrediction,theCVfolds=10,main="KNN",cex=0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="Prediction",main="B:SWiMS Bagging",cex=0.90)
##D 
##D     md$cvObject$Models.testPrediction[,"usrFitFunction"] <- 
##D                       md$cvObject$Models.testPrediction[,"usrFitFunction"] - 0.5
##D     md$cvObject$Models.testPrediction[,"usrFitFunction_Sel"] <- 
##D                       md$cvObject$Models.testPrediction[,"usrFitFunction_Sel"] - 0.5
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="usrFitFunction",
##D                          main="SVM",cex = 0.90)
##D     pm <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds=10,
##D                          predictor="usrFitFunction_Sel",
##D                          main="SVM with FS",cex = 0.90)
##D 
##D 
##D     # Shut down the graphics device driver
##D     dev.off()
##D 
##D    
## End(Not run)



