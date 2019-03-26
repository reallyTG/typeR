library(medicalrisk)


### Name: generate_charlson_index_df
### Title: Calculate the Charlson Comorbidity Index
### Aliases: generate_charlson_index_df

### ** Examples

# calculate Charlson Comorbidity Index for all patients in the \code{vt_inp_sample}
data(vt_inp_sample)
generate_charlson_index_df(generate_comorbidity_df(vt_inp_sample))



