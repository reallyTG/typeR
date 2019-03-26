library(CAMAN)


### Name: mixalg
### Title: Fitting Finite Mixture Models
### Aliases: mixalg
### Keywords: meta-analysis, mixture model, mix

### ** Examples

### POISSON data with weights: thai_cohort
data(thai_cohort)
mix <- mixalg(obs="counts", weights="frequency", family="poisson", 
              data=thai_cohort, numiter=18000, acc=0.00001, startk=25)


# meta analysis
data(aspirin)
mix <- mixalg(obs="logrr", var.lnOR="var", data=aspirin)


## See the documentation of golub.Merge for a
## microarray analysis example using mixalg

## See the documentation of leukDat for a disease
## mapping example using mixalg




