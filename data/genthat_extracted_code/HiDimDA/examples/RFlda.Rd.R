library(HiDimDA)


### Name: RFlda
### Title: High-Dimensional Factor-based Linear Discriminant Analysis.
### Aliases: RFlda RFlda.default RFlda.data.frame is.RFlda

### ** Examples


#train classifier with 10 genes (after a logarithmic transformation) 
# on Alon's Colon Cancer Data set. 

log10genes <- log10(AlonDS[,-1])

ldarule1 <- RFlda(log10genes,AlonDS$grouping,Selmethod="fixedp",maxp=10)     

# get in-sample classification results

predict(ldarule1,log10genes,grpcodes=levels(AlonDS$grouping))$class           	       

# compare classifications with true assignments

cat("Original classes:\n")
print(AlonDS$grouping)             		 

# Estimate error rates by four-fold cross-validation.
# Note: In cross-validation analysis it is recommended to set 
# the argument 'ldafun' to "classification", in order to speed up 
# computations by avoiding unecessary eigen-decompositions 

## Not run: 
##D 
##D CrosValRes1 <- DACrossVal(log10genes,AlonDS$grouping,TrainAlg=RFlda,
##D Selmethod="fixedp",ldafun="classification",maxp=10,kfold=4,CVrep=1)
##D summary(CrosValRes1[,,"Clerr"])
##D 
##D # Find the best factor model amongst the choices q=1 or 2
##D 
##D ldarule2 <- RFlda(log10genes,AlonDS$grouping,q="CVq",CVqtrials=1:2,
##D Selmethod="fixedp",ldafun="classification",maxp=10)
##D cat("Best error rate estimate found with q =",ldarule2$q,"\n")
##D 
##D # Perform the analysis finding the number of selected genes 
##D # by the Expanded HC scheme 
##D 
##D ldarule3 <- RFlda(log10genes,AlonDS$grouping,q=ldarule2$q)     
##D cat("Number of selected genes =",ldarule3$nvkpt,"\n")
##D 
##D # get classification results
##D 
##D predict(ldarule3,log10genes,grpcodes=levels(AlonDS$grouping))$class           	       
##D 
## End(Not run)




