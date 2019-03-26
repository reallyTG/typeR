library(HUM)


### Name: HUM-package
### Title: HUM calculation
### Aliases: HUM-package HUM
### Keywords: package multivariate nonparametric plot roc auc

### ** Examples

data(sim)

# Compute the HUM value with all possible class label permutation
indexF=c(3,4);
indexClass=2;
label=unique(sim[,indexClass])
indexLabel=label[1:3]
out=CalculateHUM_seq(sim,indexF,indexClass,indexLabel)
# Compute the HUM value with exaustive search of all class label combinations
## Not run: 
##D data(sim)
##D indexF=c(3,4);
##D indexClass=2;
##D labels=unique(sim[,indexClass])
##D amountL=4;
##D out=CalculateHUM_Ex(sim,indexF,indexClass,labels,amountL)
## End(Not run)
# Calculate the coordinates for 2D- or 3D- ROC curve and the optimal threshold point
## Not run: 
##D data(sim)
##D indexF=names(sim[,c(3),drop = FALSE])
##D indexClass=2
##D label=unique(sim[,indexClass])
##D indexLabel=label[1:3]
##D out=CalculateHUM_seq(sim,indexF,indexClass,indexLabel)
##D HUM<-out$HUM
##D seq<-out$seq
##D out=CalculateHUM_ROC(sim,indexF,indexClass,indexLabel,seq)
## End(Not run)



