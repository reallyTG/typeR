library(funModeling)


### Name: get_sample
### Title: Sampling training and test data
### Aliases: get_sample

### ** Examples

# Training and test data. Percentage of training cases default value=80%.
index_sample=get_sample(data=heart_disease, percentage_tr_rows=0.8)
# Generating the samples
data_tr=heart_disease[index_sample,]
data_ts=heart_disease[-index_sample,]



