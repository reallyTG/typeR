library(auctestr)


### Name: auc_compare
### Title: Compare AUC values using the FBH method.
### Aliases: auc_compare

### ** Examples

## load sample experiment data
data(sample_experiment_data)
## compare VariantA of ModelA and ModelB
auc_compare(sample_experiment_data,
    compare_values = c('ModelA', 'ModelB'),
    filter_value = c('VariantA'),
    time_col = 'time',
    outcome_col = 'auc',
    compare_col = 'model_id',
    over_col = 'dataset',
    filter_col = 'model_variant')
## compare VariantC of ModelA and ModelB
auc_compare(sample_experiment_data,
    compare_values = c('ModelA', 'ModelB'),
    filter_value = c('VariantC'),
    time_col = 'time',
    outcome_col = 'auc',
    compare_col = 'model_id',
    over_col = 'dataset',
    filter_col = 'model_variant')
## compare ModelC, VariantA and VariantB
auc_compare(sample_experiment_data,
    compare_values = c('VariantA', 'VariantB'),
    filter_value = c('ModelC'),
    time_col = 'time',
    outcome_col = 'auc',
    compare_col = 'model_variant',
    over_col = 'dataset',
    filter_col = 'model_id')



