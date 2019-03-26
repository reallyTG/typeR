library(cregg)


### Name: cj_tidy
### Title: Tidy a conjoint dataset
### Aliases: cj_tidy

### ** Examples

## Not run: 
##D data("wide_conjoint")
##D 
##D # character string interface
##D ## profile_variables
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
##D ## task variables
##D list2 <- list(choice = paste0("choice_", letters[1:4]),
##D               timing = paste0("timing_", letters[1:4]))
##D 
##D # formula interface
##D ## profile_variables
##D list1 <- list(
##D    feature1 = list(
##D        ~ feature1a1 + feature1b1 + feature1c1 + feature1d1,
##D        ~ feature1a2 + feature1b2 + feature1c2 + feature1d2
##D    ),
##D    feature2 = list(
##D        ~ feature2a1 + feature2b1 + feature2c1 + feature2d1,
##D        ~ feature2a2 + feature2b2 + feature2c2 + feature2d2
##D    ),
##D    feature3 = list(
##D        ~ feature3a1 + feature3b1 + feature3c1 + feature3d1,
##D        ~ feature3a2 + feature3b2 + feature3c2 + feature3d2
##D    ),
##D    rating = list(
##D        ~ rating_a1 + rating_b1 + rating_c1 + rating_d1,
##D        ~ rating_a2 + rating_b2 + rating_c2 + rating_d2
##D    )
##D )
##D # task variables
##D list2 <- list(choice = ~ choice_a + choice_b + choice_c + choice_d,
##D               timing = ~ timing_a + timing_b + timing_c + timing_d)
##D 
##D 
##D # perform reshape
##D str(long <- cj_tidy(wide_conjoint,
##D                     profile_variables = list1,
##D                     task_variables = list2,
##D                     id = ~ respondent))
##D stopifnot(nrow(long) == nrow(wide_conjoint)*4*2)
##D 
##D # recode outcome so it is coded sensibly
##D long$chosen <- ifelse((long$profile == "A" & long$choice == 1) | 
##D                        (long$profile == "B" & long$choice == 2), 1, 0)
##D # use for analysis
##D cj(long, chosen ~ feature1 + feature2 + feature3, id = ~ respondent)
## End(Not run)



