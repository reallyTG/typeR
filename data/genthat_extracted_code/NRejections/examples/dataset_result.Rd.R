library(NRejections)


### Name: dataset_result
### Title: Fit all models for a single dataset
### Aliases: dataset_result

### ** Examples

samp.res = dataset_result( X = "complaints",
           C = c("privileges", "learning"),
           Ys = c("rating", "raises"),
           d = attitude,
           center.stats = FALSE,
           bhat.orig = NA,  # bhat.orig is a single value now for just the correct Y
           alpha = 0.05 )



