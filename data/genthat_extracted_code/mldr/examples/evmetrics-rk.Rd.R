library(mldr)


### Name: Ranking-based metrics
### Title: Multi-label ranking-based evaluation metrics
### Aliases: 'Ranking-based metrics' average_precision one_error coverage
###   ranking_loss macro_auc micro_auc example_auc

### ** Examples

true_labels <- matrix(c(
1,1,1,
0,0,0,
1,0,0,
1,1,1,
0,0,0,
1,0,0
), ncol = 3, byrow = TRUE)
predicted_probs <- matrix(c(
.6,.5,.9,
.0,.1,.2,
.8,.3,.2,
.7,.9,.1,
.7,.3,.2,
.1,.8,.3
), ncol = 3, byrow = TRUE)

# by default, labels with same ranking are assigned ascending rankings
# in the order they are encountered
coverage(true_labels, predicted_probs)
# in the following, labels with same ranking will receive the same,
# averaged ranking
average_precision(true_labels, predicted_probs, ties_method = "average")

# the following will treat all undefined values as 0 (counting them
# for the average)
example_auc(true_labels, predicted_probs, undefined_value = 0)
# the following will ignore undefined values (not counting them for
# the average)
example_auc(true_labels, predicted_probs, undefined_value = NA, na.rm = TRUE)



