library(nmaINLA)


### Name: create_INLA_dat_pair
### Title: Prepare pairwise meta-analysis dataset for INLA.
### Aliases: create_INLA_dat_pair

### ** Examples

data('TBdat')
## Create the dataset suitable for INLA
TBdatINLA <- create_INLA_dat_pair(TBdat$TRT, TBdat$CON, TBdat$TRTTB, TBdat$CONTB)

## Check that the data are correct
print(TBdatINLA)



