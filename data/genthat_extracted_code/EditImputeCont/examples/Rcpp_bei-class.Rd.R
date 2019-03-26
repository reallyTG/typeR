library(EditImputeCont)


### Name: Rcpp_bei-class
### Title: Class '"Rcpp_bei"'
### Aliases: Rcpp_bei-class Rcpp_bei
### Keywords: classes

### ** Examples

data(SimpleEx)

## read the data
data1 = readData(SimpleEx$D.obs, SimpleEx$Ratio.edit, NULL, 
  SimpleEx$Balance.edit)

## create and initialize the model
# model1 = createModel(data1, K=15)

### run 10 iterations
# model1$Run(10)
# EI_data1 = model1$Y.edited    # store the edit-imputed dataset



