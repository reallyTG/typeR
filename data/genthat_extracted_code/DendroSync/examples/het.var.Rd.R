library(DendroSync)


### Name: het.var
### Title: Variances per varGroup stratum for heteroscedastic models
### Aliases: het.var

### ** Examples

## Calculate within-group heteroscedastic variances for conifersIP data:
 data(conifersIP)
 
 #Fit the heteroscedastic set of models (mBE, mHeCS, mHeNE, mHeUN)
 # using taxonomic grouping criteria (i.e. Species)
 ModHt <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = FALSE)
 
 #Obtain the within-group variances for the model of interest
 het.var(ModHt$mHeCS)#Heterogeneous variant of compound symmetry model
 het.var(ModHt$mHeUN)#Heterogeneous unstructured model
 



