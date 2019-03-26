library(EditImputeCont)


### Name: multipleEI
### Title: Generate Multiple Edit-imputed Datasets
### Aliases: multipleEI

### ** Examples

data(SimpleEx)
data1 = readData(SimpleEx$D.obs, SimpleEx$Ratio.edit, NULL, SimpleEx$Balance.edit)
# model1 = createModel(data1, 15)

## get 3 edit-imputed data from MCMC by storing every 100 iterations after 50 burn-in

# result1 = multipleEI(model1, n.burnin=50, m=3, int.btw.EI=100)

# dim(result1) 
## [1]   3 1000   4  
## m=3 Edit-imputed datasets of n=1000 records with p=4 variables



