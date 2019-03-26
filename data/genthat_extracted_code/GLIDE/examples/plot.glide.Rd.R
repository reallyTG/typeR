library(GLIDE)


### Name: plot.glide
### Title: A function used to draw the q-q plot
### Aliases: plot.glide

### ** Examples

## Not run: 
##D ##first generate output using the glide function
##D #load an example data
##D data(simdata)
##D simdat=simdata$simdat
##D coeff=simdata$coeff
##D 
##D formula=as.formula("outcome~age+sex+pc1+pc2+pc3")
##D genotype_columns=which(grepl("^SNP",colnames(simdat)))
##D 
##D #run glide
##D out=glide(formula=formula,exposure_coeff=coeff,genotype_columns,data=simdat,np=100000,
##D qcutoff=0.2,parallel=TRUE,corenumber=1,verbose=TRUE)
##D 
##D ##draw the plot
##D plot.glide(out)
## End(Not run)



