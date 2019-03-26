library(Surrogate)


### Name: Prentice
### Title: Evaluates surrogacy based on the Prentice criteria for
###   continuous endpoints (single-trial setting)
### Aliases: Prentice
### Keywords: Single-trial setting Prentice criteria

### ** Examples


## Load the ARMD dataset
data(ARMD)

## Evaluate the Prentice criteria in the ARMD dataset 
Prent <- Prentice(Dataset=ARMD, Surr=Diff24, True=Diff52, Treat=Treat, Pat.ID=Id)

# Summary of results
summary(Prent)



