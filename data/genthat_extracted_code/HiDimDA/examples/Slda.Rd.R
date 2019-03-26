library(HiDimDA)


### Name: Slda
### Title: Shrunken Linear Discriminant Analysis.
### Aliases: Slda Slda.default Slda.data.frame is.Slda

### ** Examples


# train classifier on Alon's Colon Cancer Data set 
# after a logarithmic transformation 
# (selecting genes by the Expanded HC scheme). 

ldarule <- Slda(log10(AlonDS[,-1]),AlonDS$grouping)     

# show classification rule

print(ldarule)

# get in-sample classification results

predict(ldarule,log10(AlonDS[,-1]),grpcodes=levels(AlonDS$grouping))$class           	       

# compare classifications with true assignments

cat("Original classes:\n")
print(AlonDS[,1])             		 


# Estimate error rates by four-fold cross-validation.
# Note: In cross-validation analysis it is recommended to set 
# the argument 'ldafun' to "classification", in order to speed up 
# computations by avoiding unecessary eigen-decompositions 

## Not run: 
##D 
##D CrosValRes <- DACrossVal(log10(AlonDS[,-1]),AlonDS$grouping,TrainAlg=Slda,
##D ldafun="classification",kfold=4,CVrep=1)
##D summary(CrosValRes[,,"Clerr"])
##D 
## End(Not run)
         	       



