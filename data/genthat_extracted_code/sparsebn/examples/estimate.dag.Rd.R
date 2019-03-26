library(sparsebn)


### Name: estimate.dag
### Title: Estimate a DAG from data
### Aliases: estimate.dag

### ** Examples


# Estimate a DAG from the cytometry data
data(cytometryContinuous)
dat <- sparsebnData(cytometryContinuous$data, type = "c", ivn = cytometryContinuous$ivn)
estimate.dag(dat)




