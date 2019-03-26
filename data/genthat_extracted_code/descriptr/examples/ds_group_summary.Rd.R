library(descriptr)


### Name: ds_group_summary
### Title: Groupwise descriptive statistics
### Aliases: ds_group_summary group_summary plot.ds_group_summary

### ** Examples

# ds_group summary
ds_group_summary(mtcarz, cyl, mpg)

# boxplot
k <- ds_group_summary(mtcarz, cyl, mpg)
plot(k)

# tibble
k$tidy_stats




