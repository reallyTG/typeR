library(FRESA.CAD)


### Name: FilterUnivariate
### Title: Univariate Filters
### Aliases: FilterUnivariate univariate_Logit univariate_residual
###   univariate_Wilcoxon univariate_tstudent univariate_correlation
###   correlated_Remove
### Keywords: Feature_Filtering

### ** Examples

    ## Not run: 
##D 
##D         library("FRESA.CAD")
##D 
##D         ### Univariate Filter Examples ####
##D 
##D         # Get the stage C prostate cancer data from the rpart package
##D         data(stagec,package = "rpart")
##D 
##D         # Prepare the data. Create a model matrix without the event time and interactions
##D         stagec$pgtime <- NULL
##D         stagec$eet <- as.factor(stagec$eet)
##D         options(na.action = 'na.pass')
##D         stagec_mat <- cbind(pgstat = stagec$pgstat,
##D                             as.data.frame(model.matrix(pgstat ~ .*.,stagec))[-1])
##D         fnames <- colnames(stagec_mat)
##D         fnames <- str_replace_all(fnames,":","__")
##D         colnames(stagec_mat) <- fnames
##D 
##D         # Impute the missing data
##D         dataCancerImputed <- nearestNeighborImpute(stagec_mat)
##D         dataCancerImputed[,1:ncol(dataCancerImputed)] <- sapply(dataCancerImputed,as.numeric)
##D 
##D         # Get the top Features associated to pgstat
##D 
##D         q_values <- univariate_Logit(data=dataCancerImputed, 
##D                                     Outcome="pgstat",
##D                                     pvalue = 0.05)
##D 
##D         qValueMatrix <- q_values
##D         idiqValueMatrix <- q_values
##D         barplot(-log(q_values),las=2,cex.names=0.4,ylab="-log(Q)",
##D         main="Association with PGStat: IDI Test")
##D 
##D         q_values <- univariate_Logit(data=dataCancerImputed, 
##D                                     Outcome="pgstat", 
##D                                     uniTest="zNRI",pvalue = 0.05)
##D         qValueMatrix <- cbind(idiqValueMatrix,q_values[names(idiqValueMatrix)])
##D 
##D         q_values <- univariate_residual(data=dataCancerImputed, 
##D                                     Outcome="pgstat", 
##D                                     pvalue = 0.05,type="LOGIT")
##D         qValueMatrix <- cbind(qValueMatrix,q_values[names(idiqValueMatrix)])
##D 
##D         q_values <- univariate_tstudent(data=dataCancerImputed, 
##D                                        Outcome="pgstat", 
##D                                        pvalue = 0.05)
##D         qValueMatrix <- cbind(qValueMatrix,q_values[names(idiqValueMatrix)])
##D 
##D         q_values <- univariate_Wilcoxon(data=dataCancerImputed, 
##D                                        Outcome="pgstat", 
##D                                        pvalue = 0.05)
##D         qValueMatrix <- cbind(qValueMatrix,q_values[names(idiqValueMatrix)])
##D 
##D         q_values <- univariate_correlation(data=dataCancerImputed, 
##D                                        Outcome="pgstat", 
##D                                        pvalue = 0.05)
##D         qValueMatrix <- cbind(qValueMatrix,q_values[names(idiqValueMatrix)])
##D 
##D         q_values <- univariate_correlation(data=dataCancerImputed, 
##D                                           Outcome="pgstat", 
##D                                           pvalue = 0.05,
##D                                           method = "pearson")
##D 
##D         #The qValueMatrix has the qValues of all filter methods.  
##D         qValueMatrix <- cbind(qValueMatrix,q_values[names(idiqValueMatrix)])
##D         colnames(qValueMatrix) <- c("IDI","NRI","F","t","W","K","P")
##D         #Do the log transform to display the heatmap
##D         qValueMatrix <- -log10(qValueMatrix)
##D         #the Heatmap of the q-values
##D         gplots::heatmap.2(qValueMatrix,Rowv = FALSE,dendrogram = "col",
##D         main = "Method q.values",cexRow = 0.4)
##D 
##D     
## End(Not run)



