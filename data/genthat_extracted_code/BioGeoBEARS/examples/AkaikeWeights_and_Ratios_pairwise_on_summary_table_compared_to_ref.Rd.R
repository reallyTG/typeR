library(BioGeoBEARS)


### Name: AkaikeWeights_and_Ratios_pairwise_on_summary_table_compared_to_ref
### Title: Get the ratio between the pairwise Akaike Weights
### Aliases:
###   AkaikeWeights_and_Ratios_pairwise_on_summary_table_compared_to_ref

### ** Examples

test=1

tmptable = adf(c(40, 50, 60))
names(tmptable) = "AIC"
AkaikeWeights_and_Ratios_pairwise_on_summary_table_compared_to_ref(
restable=tmptable, colname_to_use="AIC", ref_model="best", add_to_table=TRUE)



