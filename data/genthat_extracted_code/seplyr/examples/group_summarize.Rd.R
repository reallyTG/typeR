library(seplyr)


### Name: group_summarize
### Title: group_by and summarize as an atomic action.
### Aliases: group_summarize group_summarise

### ** Examples



group_summarize(datasets::mtcars,
                    c("cyl", "gear"),
                    group_mean_mpg = mean(mpg),
                    group_mean_disp = mean(disp)) %.>%
  head(.)




