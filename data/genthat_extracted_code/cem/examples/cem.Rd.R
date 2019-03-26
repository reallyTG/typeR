library(cem)


### Name: cem
### Title: Coarsened Exact Matching
### Aliases: cem
### Keywords: multivariate datagen

### ** Examples

## Not run: 
##D data(LL)
##D 
##D    
##D todrop <- c("treated","re78")
##D    
##D imbalance(LL$treated, LL, drop=todrop)
##D 
##D # cem match: automatic bin choice
##D mat <- cem(treatment="treated", data=LL, drop="re78")
##D mat
##D 
##D # cem match: user choiced coarsening
##D re74cut <- hist(LL$re74, br=seq(0,max(LL$re74)+1000, by=1000),plot=FALSE)$breaks
##D re75cut <- hist(LL$re75, br=seq(0,max(LL$re75)+1000, by=1000),plot=FALSE)$breaks
##D agecut <- hist(LL$age, br=seq(15,55, length=14),plot=FALSE)$breaks
##D mycp <- list(re75=re75cut, re74=re74cut, age=agecut)
##D mat <- cem(treatment="treated",data=LL, drop="re78",cutpoints=mycp)
##D mat
##D 
##D 
##D # cem match: user choiced coarsening, k-to-k matching
##D mat <- cem(treatment="treated",data=LL, drop="re78",cutpoints=mycp,k2k=TRUE)
##D mat
##D 
##D # mahalnobis matching: we use MatchIt
##D if(require(MatchIt)){
##D mah <- matchit(treated~age+education+re74+re75+black+hispanic+nodegree+married+u74+u75,
##D    distance="mahalanobis", data=LL)
##D mah
##D #imbalance
##D imbalance(LL$treated, LL, drop=todrop, weights=mah$weights)
##D }
##D 
##D # Multiply Imputed data
##D # making use of Amelia for multiple imputation
##D if(require(Amelia)){
##D  data(LL)
##D  n <- dim(LL)[1]
##D  k <- dim(LL)[2]
##D 
##D  set.seed(123)
##D 
##D  LL1 <- LL
##D  idx <- sample(1:n, .3*n)
##D  invisible(sapply(idx, function(x) LL1[x,sample(2:k,1)] <<- NA))
##D 
##D  imputed <- amelia(LL1,noms=c("black","hispanic","treated","married",
##D                               "nodegree","u74","u75")) 
##D  imputed <- imputed$imputations[1:5]
##D # without information on which observation has missing values
##D  mat1 <- cem("treated", datalist=imputed, drop="re78")
##D  mat1
##D 
##D # ATT estimation
##D  out <- att(mat1, re78 ~ treated, data=imputed)
##D 
##D 
##D # with information about missingness
##D  mat2 <- cem("treated", datalist=imputed, drop="re78", data=LL1)
##D  mat2
##D 
##D # ATT estimation
##D  out <- att(mat2, re78 ~ treated, data=imputed)
##D }
## End(Not run)



