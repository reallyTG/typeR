## ---- results="hide", message=FALSE--------------------------------------
library(penalized)
data(nki70)

## ----warning=FALSE-------------------------------------------------------
library(survival)
set.seed(21983)
w<-100 # number of random permutations
pvalues <- matrix(nr=w,nc=70)
survobj <- Surv(time=nki70$time, event=nki70$event)



#compute the 70 p-values for each random permutation
for(j in 1:w){
  if(j==1){  
    permdata <- nki70 #original data
  }
  else{
    permdata <- nki70[sample(nrow(nki70)),] #randomly shuffle the rows
  }
  for (i in 1:70) {
    form <- as.formula(paste("survobj ~ ", names(nki70)[i+7] ))
    coxobj <- coxph(form, data=permdata)
    sumcoxobj <- summary(coxobj)
    pvalues[j,i] <- sumcoxobj$coefficients[,5]
  }
}


## ------------------------------------------------------------------------
sum(pvalues[1,]<0.03)

## ------------------------------------------------------------------------
library(confSAM)  
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.03, alpha=0.1, method="simple")[3]


## ------------------------------------------------------------------------
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.03, alpha=0.1, method="simple")

## ------------------------------------------------------------------------
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.03, alpha=0.1, method="full") 

## ------------------------------------------------------------------------
#simple method
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.2, alpha=0.1, method="simple") 
#approximation method
confSAM(p=pvalues[1,], PM=pvalues, cutoff=0.2, alpha=0.1, method="approx", ncombs=1000)[3]    

