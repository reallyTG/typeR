library(mousetrap)


### Name: mt_measures
### Title: Calculate mouse-tracking measures.
### Aliases: mt_measures

### ** Examples

mt_example <- mt_derivatives(mt_example)
mt_example <- mt_deviations(mt_example)
mt_example <- mt_measures(mt_example)

# Merge measures with trial data
mt_example_results <- dplyr::inner_join(
  mt_example$data, mt_example$measures,
  by="mt_id")
  



