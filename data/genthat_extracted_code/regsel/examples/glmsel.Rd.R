library(regsel)


### Name: glmsel
### Title: Generalised linear models with variable selection
### Aliases: glmsel

### ** Examples

data(bank)
glmsel(y~age+as.factor(job)+as.factor(marital)+as.factor(education)+as.factor(default)+balance
+as.factor(housing)+as.factor(loan)+as.factor(contact)+as.factor(day)+month+duration+campaign
+pdays+previous, data=bank, varsel="enet")



