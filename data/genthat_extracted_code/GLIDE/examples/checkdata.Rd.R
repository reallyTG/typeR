library(GLIDE)


### Name: checkdata
### Title: A function used to check the core inputs of function glide
### Aliases: checkdata

### ** Examples

#load an example data; it includes a dataframe "simdat" and a one-column dataframe  "coeff"
data(simdata)
simdat=simdata$simdat
coeff=simdata$coeff
formula=as.formula("outcome~age+sex+pc1+pc2+pc3")
genotype_columns=which(grepl("^SNP",colnames(simdat)))
checkdata(formula=formula,exposure_coeff=coeff,genotype_columns,data=simdat)



