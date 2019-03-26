library(cregg)


### Name: wide_conjoint
### Title: Example of a raw, "wide" conjoint dataset to demonstrate
###   functionality of 'cj_tidy'
### Aliases: wide_conjoint
### Keywords: datasets

### ** Examples

## Not run: 
##D data("wide_conjoint")
##D # feature_variables
##D list1 <- list(
##D  feature1 = list(
##D      names(wide_conjoint)[grep("^feature1.{1}1", names(wide_conjoint))],
##D      names(wide_conjoint)[grep("^feature1.{1}2", names(wide_conjoint))]
##D  ),
##D  feature2 = list(
##D      names(wide_conjoint)[grep("^feature2.{1}1", names(wide_conjoint))],
##D      names(wide_conjoint)[grep("^feature2.{1}2", names(wide_conjoint))]
##D  ),
##D  feature3 = list(
##D      names(wide_conjoint)[grep("^feature3.{1}1", names(wide_conjoint))],
##D      names(wide_conjoint)[grep("^feature3.{1}2", names(wide_conjoint))]
##D  ),
##D  rating = list(
##D      names(wide_conjoint)[grep("^rating.+1", names(wide_conjoint))],
##D      names(wide_conjoint)[grep("^rating.+2", names(wide_conjoint))]
##D  )
##D )
##D # task variables
##D list2 <- list(choice = paste0("choice_", letters[1:4]),
##D               timing = paste0("timing_", letters[1:4]))
##D str(cj_tidy(wide_conjoint, profile_variables = list1, task_variables = list2, id = ~ respondent))
## End(Not run)



