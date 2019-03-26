library(cpgen)


### Name: get_cor
### Title: Compute the prediction accuracy from Cross Validition
### Aliases: get_cor
### Keywords: Genomic Prediction Tools

### ** Examples

### Running a 4-fold cross-validation with one repetition:
## Not run: 
##D 
##D # generate random data
##D rand_data(500,5000)
##D 
##D ### compute the list of masked phenotype-vectors for CV
##D y_CV <- cCV(y,fold=4,reps=1)
##D 
##D 
##D ### Cross Validation using GBLUP
##D G.A <- cgrm.A(M,lambda=0.01)
##D 
##D 
##D ### generate the list of design matrices for clmm
##D Z_list = list(t(chol(G.A)))
##D 
##D ### specify options
##D h2 = 0.3
##D scale = unlist(lapply(y_CV,function(x)var(x,na.rm=T))) * h2
##D df = rep(5,length(y_CV))
##D par_random = list(list(method="ridge",scale=scale,df=df))
##D 
##D ### run 
##D fit <- clmm(y_CV, Z=Z_list, par_random=par_random, niter=5000, burnin=2500)
##D 
##D ### inspect results
##D str(fit)
##D 
##D ### obtain predictions
##D pred <- get_pred(fit)
##D 
##D ### prediction accuracy
##D get_cor(pred,y_CV,y)
## End(Not run)




