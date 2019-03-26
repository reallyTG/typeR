library(KMDA)


### Name: hcc
### Title: Metabolomic Study on Hepatocellular Carcinoma (HCC)
### Aliases: hcc

### ** Examples

data(hcc)
hccpeak=hcc[,3:57]  
## Deleting the first two columns. All columns in hccpeak is abundance level measurements. 
pearson.group(hccpeak[1:30,],0.95) 
## Grouping the first 30 metabolites in hcc dataset to form metabolite-sets.



