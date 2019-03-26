library(sdcMicro)


### Name: mergeHouseholdData
### Title: Replaces the raw household-level data with the anonymized
###   household-level data in the full dataset for anonymization of data
###   with a household structure (or other hierarchical structure).
###   Requires a matching household ID in both files.
### Aliases: mergeHouseholdData

### ** Examples

## Load data
x <- testdata
## Create household level dataset
x_hh <- selectHouseholdData(dat=x, hhId="ori_hid",
  hhVars=c("urbrur", "roof",  "walls", "water", "electcon", "household_weights"))
## Anonymize household level dataset and extract data
sdc_hh <- createSdcObj(x_hh, keyVars=c('urbrur','roof'), w='household_weights')
sdc_hh <- kAnon(sdc_hh, k = 3)
x_hh_anon <- extractManipData(sdc_hh)

## Merge anonymized household level data back into the full dataset
x_anonhh <- mergeHouseholdData(x, "ori_hid", x_hh_anon)

## Anonymize full dataset and extract data
sdc_full <- createSdcObj(x_anonhh, keyVars=c('sex', 'age', 'urbrur', 'roof'), w='sampling_weight')
sdc_full <- kAnon(sdc_full, k = 3)
x_full_anon <- extractManipData(sdc_full)



