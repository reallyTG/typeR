library(h2o)


### Name: h2o.aggregated_frame
### Title: Retrieve an aggregated frame from an Aggregator model
### Aliases: h2o.aggregated_frame

### ** Examples

## No test: 
library(h2o)
h2o.init()
df <- h2o.createFrame(rows=100, cols=5, categorical_fraction=0.6, integer_fraction=0,
                      binary_fraction=0, real_range=100, integer_range=100, missing_fraction=0)
target_num_exemplars=1000
rel_tol_num_exemplars=0.5
encoding="Eigen"
agg <- h2o.aggregator(training_frame=df,
                     target_num_exemplars=target_num_exemplars,
                     rel_tol_num_exemplars=rel_tol_num_exemplars,
                     categorical_encoding=encoding)
# Use the aggregated frame to create a new dataframe
new_df <- h2o.aggregated_frame(agg)
## End(No test)



