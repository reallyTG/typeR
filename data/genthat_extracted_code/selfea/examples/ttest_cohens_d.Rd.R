library(selfea)


### Name: ttest_cohens_d
### Title: ttest_cohens_d
### Aliases: ttest_cohens_d

### ** Examples

library(selfea)

values <- c(8,10,8,8,11,29,26,22,27,26)
groups <- c("U200","U200","U200","U200","U200","U600","U600","U600","U600","U600")
list_result <- ttest_cohens_d (values, groups, 0.05, 0.90)



