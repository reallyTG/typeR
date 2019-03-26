library(seplyr)


### Name: add_group_summaries
### Title: Simulate the group_by/mutate pattern with an explicit summarize
###   and join.
### Aliases: add_group_summaries

### ** Examples



add_group_summaries(datasets::mtcars,
                    c("cyl", "gear"),
                    group_mean_mpg = mean(mpg),
                    group_mean_disp = mean(disp)) %.>%
  head(.)




