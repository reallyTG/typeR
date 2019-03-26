library(GLIDE)


### Name: glide
### Title: Evaluate individual and global pleiotropy among genotypes being
###   used as instrumental variables in Mendelian randomization studies.
### Aliases: glide
### Keywords: Causal Inference, Mendelian Randomization, Pleiotropy

### ** Examples

##load an example data.
data(simdata)
#The example dataset is a list composed of two dataframes. 
#simat stores 20,000 observations of 81 variables, including outcome, 5 ajusting covariates, 
#and 75 SNPs.
simdat=simdata$simdat
#coeff stores the 75 external regression cofficients.
coeff=simdata$coeff
#We define the regression formula for outcome and adjusting covariates
formula=as.formula("outcome~age+sex+pc1+pc2+pc3")
#We next define the columns in simdat that contain genotype data
genotype_columns=which(grepl("^SNP",colnames(simdat)))

## Not run: 
##D ##run glide
##D out=glide(formula=formula,exposure_coeff=coeff,genotype_columns,data=simdat,np=100000,
##D qcutoff=0.2,parallel=TRUE,corenumber=1,verbose=TRUE)
##D 
##D ##use more cores
##D out=glide(formula=formula,exposure_coeff=coeff,genotype_columns,data=simdat,np=100000,
##D qcutoff=0.2,parallel=TRUE,corenumber=4,verbose=TRUE)
## End(Not run)



