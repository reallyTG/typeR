library(nmaINLA)


### Name: create_INLA_dat
### Title: Prepare network meta-analysis dataset for INLA.
### Aliases: create_INLA_dat

### ** Examples

data('Smokdat')
## Create the dataset suitable for INLA
SmokdatINLA <- create_INLA_dat(dat = Smokdat, armVars = c('treatment' = 't', 'responders' = 'r'
,'sampleSize' = 'n'), nArmsVar = 'na')
## Check that the data are correct
print(SmokdatINLA)



