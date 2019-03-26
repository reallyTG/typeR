library(pmml)


### Name: pmml.ada
### Title: Generate PMML for ada objects
### Aliases: pmml.ada

### ** Examples


library(ada)
library(pmml)
data(audit)

fit <- ada(Adjusted~Employment+Education+Hours+Income,iter=3, audit)
pmml_fit <- pmml(fit)




