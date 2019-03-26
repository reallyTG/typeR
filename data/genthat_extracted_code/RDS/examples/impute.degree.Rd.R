library(RDS)


### Name: impute.degree
### Title: Imputes missing degree values
### Aliases: impute.degree

### ** Examples

data(faux)
rds.data <- faux
rds.data$network.size[c(1,2,30,52,81,101,108,111)] <- NA
impute.degree(rds.data)
impute.degree(rds.data,trait.variable="X")
impute.degree(rds.data,trait.variable="X",method="quantile")



