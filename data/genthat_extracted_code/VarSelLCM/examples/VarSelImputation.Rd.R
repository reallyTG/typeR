library(VarSelLCM)


### Name: VarSelImputation
### Title: Imputation of missing values
### Aliases: VarSelImputation

### ** Examples

# Data loading
data("heart")

# Clustering en 2 classes
results <- VarSelCluster(heart[,-13], 2)

# Data where missing values will be imputed
newdata <- heart[1:2,-13]
newdata[1,1] <- NA
newdata[2,2] <- NA

# Imputation
VarSelImputation(results, newdata)




