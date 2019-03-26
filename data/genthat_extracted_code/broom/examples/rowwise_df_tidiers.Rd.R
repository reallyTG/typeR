library(broom)


### Name: rowwise_df_tidiers
### Title: Tidying methods for rowwise_dfs from dplyr, for tidying each row
###   and recombining the results
### Aliases: rowwise_df_tidiers tidy.rowwise_df tidy_.rowwise_df
###   augment.rowwise_df augment_.rowwise_df glance.rowwise_df
###   glance_.rowwise_df tidy.tbl_df augment.tbl_df glance.tbl_df

### ** Examples


library(dplyr)
regressions <- mtcars %>%
    group_by(cyl) %>%
    do(mod = lm(mpg ~ wt, .))

regressions

regressions %>% tidy(mod)
regressions %>% augment(mod)
regressions %>% glance(mod)

# we can provide additional arguments to the tidying function
regressions %>% tidy(mod, conf.int = TRUE)

# we can also include the original dataset as a "data" argument
# to augment:
regressions <- mtcars %>%
    group_by(cyl) %>%
    do(mod = lm(mpg ~ wt, .), original = (.))

# this allows all the original columns to be included:
regressions %>% augment(mod)  # doesn't include all original
regressions %>% augment(mod, data = original)  # includes all original




