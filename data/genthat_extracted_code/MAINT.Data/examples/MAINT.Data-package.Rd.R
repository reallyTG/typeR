library(MAINT.Data)


### Name: MAINT.Data-package
### Title: Modelling and Analizing Interval Data
### Aliases: MAINT.Data-package MAINT.Data
### Keywords: MAINT.Data Interval Data Symbolic Data Analysis MANOVA for
###   Interval Data Parametric modelling of Interval Data Statistical tests
###   for Interval Data

### ** Examples

# Create an Interval-Data object containing the intervals for 899 observations 
# on the temperatures by quarter in 60 Chinese meteorological stations.

ChinaT <- IData(ChinaTemp[1:8],VarNames=c("T1","T2","T3","T4"))

#Display the first and last observations

head(ChinaT)
tail(ChinaT)

#Print summary statistics

summary(ChinaT)

#Create a new data set considering only the Winter (1st and 4th) quarter intervals

ChinaWT <- ChinaT[,c(1,4)]

# Estimate normal distributuion parameters by maximum likelihood, assuming 
# the classical (unrestricted) covariance configuration Case 1

ChinaWTE.C1 <- mle(ChinaWT,CovCase=1)
cat("Winter temperatures of China -- normal maximum likelhiood estimation results:\n")
print(ChinaWTE.C1)
cat("Standard Errors of Estimators:\n") ; print(stdEr(ChinaWTE.C1))

# Estimate normal distributuion parameters by maximum likelihood, 
# assuming that one of the C2, C3 or C4 restricted covariance configuration cases hold

ChinaWTE.C234 <- mle(ChinaWT,CovCase=2:4)
cat("Winter temperatures of China -- normal maximum likelhiood estimation results:\n")
print(ChinaWTE.C234)
cat("Standard Errors of Estimators:\n") ; print(stdEr(ChinaWTE.C234))

# Estimate normal distributuion  parameters robustly by fast maximun trimmed likelihood, 
# assuming that one of the C2, C3 or C4 restricted covariance configuration cases hold

## Not run: 
##D ChinaWTE.C234 <- fasttle(ChinaWT,CovCase=2:4)
##D cat("Winter temperatures of China -- normal maximum trimmed likelhiood estimation results:\n")
##D print(ChinaWTE.C234)
##D 
##D # Estimate skew-normal distributuion  parameters 
##D 
##D ChinaWTE.SkN <- mle(ChinaWT,Model="SKNormal")
##D cat("Winter temperatures of China -- Skew-Normal maximum likelhiood estimation results:\n")
##D print(ChinaWTE.SkN)
##D cat("Standard Errors of Estimators:\n") ; print(stdEr(ChinaWTE.SkN))
## End(Not run)

#MANOVA tests assuming that configuration case 1 (unrestricted covariance) 
# or 3 (MidPoints independent of Log-Ranges) holds.  

ManvChinaWT.C13 <- MANOVA(ChinaWT,ChinaTemp$GeoReg,CovCase=c(1,3))
cat("Winter temperatures of China -- MANOVA by geografical regions results:\n")
print(ManvChinaWT.C13)

#Linear Discriminant Analysis

ChinaWT.lda <- lda(ManvChinaWT.C13)
cat("Winter temperatures of China -- linear discriminant analysis results:\n")
print(ChinaWT.lda)
cat("lda Prediction results:\n")
print(predict(ChinaWT.lda,ChinaWT)$class)

## Not run: 
##D #Estimate error rates by ten-fold cross-validation 
##D 
##D CVlda <- DACrossVal(ChinaWT,ChinaTemp$GeoReg,TrainAlg=lda,
##D CovCase=BestModel(H1res(ManvChinaWT.C13)),CVrep=1)
##D summary(CVlda[,,"Clerr"])
##D glberrors <- 
##D   apply(CVlda[,,"Nk"]*CVlda[,,"Clerr"],1,sum)/apply(CVlda[,,"Nk"],1,sum)
##D cat("Average global classification error =",mean(glberrors),"\n")
##D 
##D #Robust Quadratic Discriminant Analysis
##D 
##D ChinaWT.rqda <- Robqda(ChinaWT,ChinaTemp$GeoReg)
##D cat("Winter temperatures of China -- robust quadratic discriminant analysis results:\n")
##D print(ChinaWT.rqda)
##D cat("robust qda prediction results:\n")
##D print(predict(ChinaWT.rqda,ChinaWT)$class)
## End(Not run)

# Create an Interval-Data object containing the intervals for characteristics 
# of 27 cars models.

CarsIdt <- IData(Cars[1:8],VarNames=c("Price","EngineCapacity","TopSpeed","Acceleration"))

#Display the first and last observations

head(CarsIdt)
tail(CarsIdt)

# Estimate normal distributuion parameters 

CarsNE <- mle(CarsIdt)
cat("Cars data -- normal maximum likelhiood estimation results:\n")
print(CarsNE)
cat("Standard Errors of Estimators:\n") ; print(stdEr(CarsNE))

# Estimate normal distributuion  parameters robustly by full maximum trimmed likelihood, 

## Not run: 
##D CarsTE <- fulltle(CarsIdt)
##D cat("Cars data -- normal maximum trimmed likelhiood estimation results:\n")
##D print(CarsTE)
##D 
##D # Estimate parameters searching through normal and Skew-Normal distributions.
##D 
##D CarsNSNE <- mle(CarsIdt,Model="NrmandSKN")
##D cat("Cars data  -- Maximum likelhiood estimation results:\n")
##D print(CarsNSNE)
##D cat("Standard Errors of Estimators:\n") ; print(stdEr(CarsNSNE))
## End(Not run)

# Create an Interval-Data object containing the intervals of loan data
# (from the Kaggle Data Science platform) aggregated by loan purpose

LbyPIdt <- IData(LoansbyPurpose_minmaxDt,
  VarNames=c("ln-inc","ln-revolbal","open-acc","total-acc")) 

print(LbyPIdt)

## Not run: 
##D 
##D #Fit homocedastic Gaussian mixtures with up to four components
##D 
##D mclustres <- Idtmclust(LbyPIdt,G=1:4)
##D print(mclustres)
##D 
##D #Display the results of the best mixture according to the BIC
##D 
##D summary(mclustres,parameters=TRUE,classification=TRUE)
## End(Not run)





