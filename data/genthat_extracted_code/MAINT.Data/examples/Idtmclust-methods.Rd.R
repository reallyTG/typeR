library(MAINT.Data)


### Name: Idtmclust-methods
### Title: Methods for function Idtmclust in Package 'MAINT.Data'
### Aliases: Idtmclust-methods Idtmclust,IData-method Idtmclust
### Keywords: interval data model based clustering

### ** Examples


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




