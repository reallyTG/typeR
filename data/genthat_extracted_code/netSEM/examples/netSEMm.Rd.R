library(netSEM)


### Name: netSEMm
### Title: network Structural Equation Modeling (netSEM)
### Aliases: netSEMm

### ** Examples

## Load the sample acrylic data set
data(acrylic)

## Run netSEM
ans <- netSEMm(acrylic)

## Subset dataset
res <- subsetData(ans,cutoff=c(0.3,0.6,0.8))

## Plot the network model with adjusted-R-squred of c(0.3,0.6,0.8)
plot(ans,res)

## Summary
summary(ans)

## Extract relations between IrradTot and IAD2
cf <- path(ans,from ="IAD2",to="IrradTot")
print(cf)

## Print three components of the result
ans$table
ans$bestModels
ans$allModels



