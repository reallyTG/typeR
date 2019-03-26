library(HiDimDA)


### Name: Dlda
### Title: Diagonal Linear Discriminant Analysis.
### Aliases: Dlda Dlda.default Dlda.data.frame is.Dlda

### ** Examples


# train classifier on Alon's Colon Cancer Data Set 
#(after a logarithmic transformation). 

log10genes <- log10(AlonDS[,-1])


ldarule <- Dlda(log10genes,AlonDS$grouping)     

# show classification rule

print(ldarule)

# get in-sample classification results

predict(ldarule,log10genes,grpcodes=levels(AlonDS$grouping))$class           	       

# compare classifications with true assignments

cat("Original classes:\n")
print(AlonDS$grouping)             		 

# Estimate error rates by four-fold cross-validation.
# Note: In cross-validation analysis it is recommended to set 
# the argument 'ldafun' to "classification", in order to speed up 
# computations by avoiding unecessary eigen-decompositions 

## Not run: 
##D 
##D CrosValRes <- DACrossVal(log10genes,AlonDS$grouping,TrainAlg=Dlda,
##D ldafun="classification",kfold=4,CVrep=1)
##D summary(CrosValRes[,,"Clerr"])
##D 
## End(Not run)
         	       



