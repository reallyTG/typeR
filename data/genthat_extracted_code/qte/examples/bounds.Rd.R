library(qte)


### Name: bounds
### Title: bounds
### Aliases: bounds

### ** Examples

## load the data
data(lalonde)

## Run the bounds method with no covariates
b1 <- bounds(re ~ treat, t=1978, tmin1=1975, data=lalonde.psid.panel,
  idname="id", tname="year")
summary(b1)




